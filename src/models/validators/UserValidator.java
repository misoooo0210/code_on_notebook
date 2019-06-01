package models.validators;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;

import models.User;
import utils.DBUtil;

public class UserValidator {
    public static List<String> validate(User u, Boolean username_duplicate_check_flag, Boolean email_duplicate_check_flag, Boolean password_check_flag) {
        List<String> errors = new ArrayList<String>();

        String email_error = _validateEmail(u.getEmail(), email_duplicate_check_flag);
        if(!email_error.equals("")) {
            errors.add(email_error);
        }

        String username_error = _validateUsername(u.getUsername(), username_duplicate_check_flag);
        if(!username_error.equals("")) {
            errors.add(username_error);
        }

        String password_error = _validatePassword(u.getPassword(), password_check_flag);
        if(!password_error.equals("")) {
            errors.add(password_error);
        }

        return errors;
    }

    // メールアドレス
    private static String _validateEmail(String email, Boolean email_duplicate_check_flag) {
        // 必須入力チェック
        if(email == null || email.equals("")) {
            return "メールアドレスを入力してください。";
        }

        // 既に登録されているメールアドレスとの重複チェック
        if(email_duplicate_check_flag) {
            EntityManager em = DBUtil.createEntityManager();
            long emails_count = (long)em.createNamedQuery("checkRegisteredEmail", Long.class)
                                          .setParameter("email", email)
                                          .getSingleResult();
            em.close();
            if(emails_count > 0) {
                return "別のメールアドレスを利用してください。";
            }
        }

        return "";
    }

    //ユーザ名
    private static String _validateUsername(String username, Boolean username_duplicate_check_flag) {
        if(username == null || username.equals("")) {
            return "ユーザ名を入力してください。";
        }

        //既に登録されているユーザ名との重複チェック
        if(username_duplicate_check_flag) {
            EntityManager em = DBUtil.createEntityManager();
            long users_count = (long)em.createNamedQuery("checkRegisteredUsername", Long.class)
                                          .setParameter("username", username)
                                          .getSingleResult();
            em.close();
            if(users_count > 0) {
                return "入力したユーザ名は既に使われています。他のユーザ名を設定してください。";
            }
        }

        return "";
    }

    // パスワードの必須入力チェック
    private static String _validatePassword(String password, Boolean password_check_flag) {
        // パスワードを変更する場合のみ実行
        if(password_check_flag && (password == null || password.equals(""))) {
            return "パスワードを入力してください。";
        }
        return "";
    }

}