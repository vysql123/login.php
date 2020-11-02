<!DOCTYPE html>
<html lang="ja">
    <head>
        <meta charset="UTF-8">
        <title>ログイン</title>
        <link rel="stylesheet" type="text/css" href="./css/css.css"> 
    </head>
    <body>
        <?php
        session_start();
        //ログアウトボタンが押された時セッションを終了させる
        if(isset($_POST["logout"])){
            session_destroy();
            header( 'Location:logininsert.php' ) ;
        }
        // 既にログイン済を確認し画面表示
        if(isset($_SESSION["authenticated"]) && $_SESSION["authenticated"] === true){
            echo "<div>ログイン済です。</div>";
        }
        else if(isset($_POST["login"]) || isset($_POST["pass"])){

            // 認証されておらずログイン成功
            if($_POST["login"] === "tester" && $_POST["pass"] === "abcd"){
                $_SESSION["authenticated"] = true;
                 $form = "
                <form action='logininsert.php' method='post'>
                <input type='submit' class='check' name='logout' value='ログアウト'>
                    <input type='text' placeholder='enter your ID' class='box-fm' name='login'>&nbsp;&nbsp;&nbsp;&nbsp;
                    <input type='password' placeholder='enter your password' class='box-fm' name='pass'>&nbsp;&nbsp;&nbsp;&nbsp;
                </form>";
                echo $form;
            }
            // ログイン失敗
            else {
                $_SESSION["authenticated"] = false;
                // ログインフォームを表示
                $form = "
                <form action='logininsert.php' method='post'>
                    <input type='text' placeholder='enter your ID' class='box-fm' name='login'>&nbsp;&nbsp;&nbsp;&nbsp;
                    <input type='password' placeholder='enter your password' class='box-fm' name='pass'>&nbsp;&nbsp;&nbsp;&nbsp;
                    <input type='submit' class='check' value='ログイン'>
                </form>";
                echo $form;
                echo "<p>アカウント情報に誤りがあります</p>";;
            }
        }
        else {
            // ログインフォームを表示
            $form = "
            <form action='logininsert.php' method='post'>
                <input type='text' placeholder='enter your ID' class='box-fm' name='login'>&nbsp;&nbsp;&nbsp;&nbsp;
                <input type='password' placeholder='enter your password' class='box-fm' name='pass'>&nbsp;&nbsp;&nbsp;&nbsp;
                <input type='submit' class='check' value='ログイン'>
            </form>";
            
            echo $form;
        }

        ?>

    </body>
</html>
