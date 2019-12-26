<?php
require "include/bittorrent.php";
dbconn();
require_once(get_langfile_path());
loggedinorreturn();
global $pollmanage_class;
if (get_user_class() < $pollmanage_class)
    permissiondenied();

$action = $_GET["action"];
$pollid = $_GET["pollid"];
$option_id = $_GET['option'];

if ($action == "edit") {
    int_check($pollid, true);
    $res = sql_query("SELECT * FROM poll_questions WHERE id = $pollid AND deleted = 0 LIMIT 1") or sqlerr(__FILE__, __LINE__);
    if (mysql_num_rows($res) == 0)
        stderr($lang_makepoll['std_error'], $lang_makepoll['std_no_poll_id']);
    $poll_question = mysql_fetch_array($res);
    $res = sql_query("SELECT * FROM poll_options WHERE question_id = $pollid") or sqlerr(__FILE__, __LINE__);
    $poll_options = [];
    while ($row = mysql_fetch_array($res))
        $poll_options[$row['id']] = $row['option_text'];

    if ($option_id) {
        $text = $_POST['text'];
        if (!$text) {
            int_check($option_id, true);
            $res = sql_query("SELECT option_text FROM poll_options WHERE question_id = $pollid AND id = $option_id");
            $arr = mysql_fetch_array($res);
            if (!$arr)
                stderr("错误", "未找到此选项或问题。");
            else
                $option_text = $arr['option_text'];
            stderr("修改选项", "<form method='post' action='makepoll.php?action=edit&pollid=$pollid&option=$option_id'><input type='text' name='text' value='{$option_text}'><input type='submit' class='btn'></form>", false);
        } else {
            sql_query("UPDATE poll_options SET option_text = " . sqlesc($text) . " WHERE question_id = $pollid AND id = $option_id");
            $Cache->delete_value('current_poll_content');
            $Cache->delete_value('current_poll_result', true);
            if (mysql_affected_rows() == 0)
                stderr("错误", "修改失败");
            else
                stderr("成功", "<a href='makepoll.php?action=edit&pollid=$pollid'>返回修改页</a>", false);
        }
    } else {
        stdhead($lang_makepoll['head_edit_poll']);
        print("<h1>" . $lang_makepoll['text_edit_poll'] . "</h1>");
        ?>
        <table border=1 cellspacing=0 cellpadding=5>
            <tr>
                <td class=rowhead><?php echo $lang_makepoll['text_question'] ?> <font color=red>*</font></td>
                <td align=left><?= $poll_question['question'] ?></td>
            </tr>
            <?php
            $i = 0;
            foreach ($poll_options as $id => $poll_option) {
                $i++;
                ?>
                <tr>
                    <td class=rowhead><?= $lang_makepoll['text_option'] . $i ?></td>
                    <td align=left><a
                                href="makepoll.php?action=edit&pollid=<?= $pollid ?>&option=<?= $id ?>"><?= $poll_option ?></a><br/>
                    </td>
                </tr>
                <?php
            }
            ?>
        </table>
        <?php
        stdfoot();
        die();
    }
}

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $question = htmlspecialchars($_POST["question"]);
    $deadline = $_POST['deadline'];
    $choice_num = $_POST['choice'];
    $options = $_POST['options'];
    $returnto = htmlspecialchars($_POST["returnto"]);

    if (!$question || count($options) < 2)
        stderr($lang_makepoll['std_error'], $lang_makepoll['std_missing_form_data']);

    sql_query("INSERT INTO poll_questions (question, deadline, choice) VALUES (" . sqlesc($question) . ", " . sqlesc($deadline) . ", " . sqlesc($choice_num) . ")") or sqlerr(__FILE__, __LINE__);
    $question_id = mysql_insert_id();
    $queries = [];
    foreach ($options as $option) {
        if ($option)
            $queries[] = "INSERT INTO poll_options (question_id, option_text) VALUES ({$question_id}, " . sqlesc($option) . ")";
    }
    sql_multi_query($queries);

    $Cache->delete_value('current_poll_content');
    $Cache->delete_value('current_poll_result', true);
    header("Location: /");
    die;
}

stdhead($lang_makepoll['head_new_poll']);
// Warn if current poll is less than 3 days old
$res = sql_query("SELECT question, added_at FROM poll_questions WHERE deleted = 0 ORDER BY added_at DESC LIMIT 1") or sqlerr();
$arr = mysql_fetch_assoc($res);
if ($arr) {
    $hours = floor((time() - strtotime($arr["added_at"])) / 3600);
    $days = floor($hours / 24);
    if ($days < 3) {
        if ($days >= 1)
            $t = $days . $lang_makepoll['text_day'] . add_s($days);
        else
            $t = $hours . $lang_makepoll['text_hour'] . add_s($hours);
        print("<p><font class=striking><b>" . $lang_makepoll['text_current_poll'] . "(<i>" . $arr["question"] . "</i>)" . $lang_makepoll['text_is_only'] . $t . $lang_makepoll['text_old'] . "</b></font></p>");
    }
}
print("<h1>" . $lang_makepoll['text_make_poll'] . "</h1>");
?>
<form method=post action=makepoll.php>
    <table border=1 cellspacing=0 cellpadding=5 id="poll_table">
        <style type="text/css">
            input.mp {
                width: 450px;
            }
        </style>
        <tr>
            <td class=rowhead><?php echo $lang_makepoll['text_question'] ?> <font color=red>*</font></td>
            <td align=left><input name=question class="mp" maxlength=255></td>
        </tr>
        <tr>
            <td class=rowhead>结束时间<font color=red>*</font></td>
            <td align=left><input type="text" name="deadline" id="deadline"
                                  value="<?= date("Y-m-d H:i:s", time() + 30 * 24 * 3600) ?>"></td>
        </tr>
        <tr>
            <td class=rowhead>可多选x项<font color=red>*</font></td>
            <td align=left><input type="number" name="choice" value="1"></td>
        </tr>
        <tr>
            <td class=rowhead><?php echo $lang_makepoll['text_option'] ?><font color=red>*</font></td>
            <td align=left><input name="options[]" class="mp" maxlength="40"><br/></td>
        </tr>
        <tr>
            <td class=rowhead><?php echo $lang_makepoll['text_option'] ?><font color=red>*</font></td>
            <td align=left><input name="options[]" class="mp" maxlength="40"><br/></td>
        </tr>


        <tr>
            <td colspan=2 align=center>
                <input type="submit" class="btn" value="<?= $lang_makepoll['submit_create_poll'] ?>">
                <input type="button" value="添加选项" class="btn" onclick="addRow()">
            </td>
        </tr>
    </table>
    <p><font color=red>*</font><?php echo $lang_makepoll['text_required'] ?></p>
    <input type=hidden name=returnto
           value="<?= htmlspecialchars($_GET["returnto"]) ? htmlspecialchars($_GET["returnto"]) : htmlspecialchars($_SERVER["HTTP_REFERER"]) ?>">
</form>

<script>
    function addRow() {
        let row_num = prompt("添加多少行呢？", "1");
        let $tr = $("#poll_table tr").eq(-2);
        for (let i = 0; i < row_num; i++) {
            $tr.after("<tr>\n" +
                "            <td class=rowhead>选项</td>\n" +
                "            <td align=left><input name=\"options[]\" class=\"mp\" maxlength=\"40\"><br/></td>\n" +
                "        </tr>");
        }
    }

    // $("#deadline").datepicker({
    //     dateFormat: "yy-mm-dd",
    //     showSecond: true,
    //     timeFormat: "hh:mm:ss",
    //     minDate: new Date()
    // });
</script>

<?php
stdfoot();
?>
