package models.validators;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;

import models.User;
import utils.DBUtil;

public class UserValidator {
    public static List<String> validate(User u, Boolean email_duplicate_check_flag, Boolean password_check_flag) {
        List<String> errors = new ArrayList<String>();

        String email_error = _validateEmail(u.getEmail(), email_duplicate_check_flag);
        if(!email_error.equals("")) {
            errors.add(email_error);
        }

        String username_error = _validateUsername(u.getUsername());
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

    //ユーザ名の必須入力チェック
    private static String _validateUsername(String username) {
        if(username == null || username.equals("")) {
            return "ユーザ名を入力してください。";
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