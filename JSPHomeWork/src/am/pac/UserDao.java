package am.pac;

import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class UserDao {
    private List<User> userList = new ArrayList<>();
    private Statement statement;


    public List<User> fillUsers() throws Exception {
        statement = Db.connector().createStatement();
        ResultSet resultSet = statement.executeQuery("select * from clientinfo");
        while (resultSet.next()) {
            userList.add(new User(resultSet.getInt(1), resultSet.getString(2),
                    resultSet.getString(3), resultSet.getString(5), resultSet.getDate(4)));
        }
        return userList;


    }

    public void addUser(User user) {
        userList.add(user);

    }

    public void insert(User user) throws Exception {
        String firstname = user.getFirsname();
        String lastname = user.getLastname();
        String email = user.getEmail();
        String dateofBirth = user.getDate().toString();

        statement = Db.connector().createStatement();
        String query = "insert into clientinfo values(null,'" + firstname + "','" + lastname + "','" + dateofBirth + "','" + email + "')";
        statement.executeUpdate(query);
        statement.close();


    }

    public List<User> returnList() {
        return userList;
    }

    public void update() throws Exception {
        userList.clear();
        fillUsers();

    }

    public void delete(int i) throws Exception {
        statement = Db.connector().createStatement();
        String query = "delete from clientinfo WHERE id = '" + i + "' ";
        statement.executeUpdate(query);
        statement.close();


    }

    public void edit(User user) throws Exception {
        statement = Db.connector().createStatement();
        String firstname = user.getFirsname();
        String lastname = user.getLastname();
        String email = user.getEmail();
        String dateofBirth = user.getDate().toString();
        String query = "update clientinfo set firstname =  '" + firstname + "',lastname = '" + lastname + "', email ='" + email + "', dateofbirth = '" + dateofBirth + "'where id = '" + user.getId() + "'";
        System.out.println(query);
        statement.executeUpdate(query);


    }

}
