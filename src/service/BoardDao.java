package service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Board;
import model.Member;
import util.JdbcConnection;

public class BoardDao {

    public int insertBoard(Board board) {

        Connection con = JdbcConnection.getConnection();
        PreparedStatement pstmt = null;
        String sql = "insert into board values(?,?,?,?,?,?,?,sysdate, ?,0,?,?,?)";
        try {
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, board.getNum());
            pstmt.setString(2, board.getWriter());
            pstmt.setString(3, board.getPass());
            pstmt.setString(4, board.getSubject());
            pstmt.setString(5, board.getContent());
            pstmt.setString(6, board.getFile1());
            pstmt.setString(7, board.getBoardid());
            pstmt.setString(8, board.getIp());
            pstmt.setInt(9, board.getRef());
            pstmt.setInt(10, board.getReflevel());
            pstmt.setInt(11, board.getRefstep());

            return pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JdbcConnection.close(con, pstmt, null);

        }

        return 0;
    }
    public int nextNum() {
        Connection con = JdbcConnection.getConnection();
        PreparedStatement pstmt = null;
        String sql = "select boardseq.nextval from dual";
        ResultSet rs = null;
        try {
            pstmt = con.prepareStatement(sql);

            rs=pstmt.executeQuery();
            rs.next();
            return rs.getInt(1);

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JdbcConnection.close(con, pstmt, rs);
        }
        return 0;
    }
    public void refStepAdd(int ref, int refstep) {
        Connection con = JdbcConnection.getConnection();
        PreparedStatement pstmt = null;
        String sql = "update board set refstep=refstep+1 "
                + " where ref = ? and refstep > ?";

        try {
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, ref);
            pstmt.setInt(2, refstep);
            pstmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JdbcConnection.close(con, pstmt, null);
        }

    }
    public int boardCount(String boardid) {
        Connection con = JdbcConnection.getConnection();
        PreparedStatement pstmt = null;
        String sql = "select count(*) from board where boardid = ?";
        ResultSet rs = null;
        try {
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, boardid);
            rs = pstmt.executeQuery();
            rs.next();
            return rs.getInt(1);
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JdbcConnection.close(con, pstmt, null);
        }
        return 0;
    }

    public List<Board> boardList(int pageInt, int limit, int boardcount, String boardid) {
        Connection con = JdbcConnection.getConnection();
        PreparedStatement pstmt = null;
        String sql = "select * from ("
                + "  select rownum rnum,  a.* from ( " +
                "select * from board  where boardid = ?"
                + " order by ref desc, refstep asc  ) a)" +
                " where rnum between ? and ?";
        ResultSet rs = null;
        List<Board> li = new ArrayList<Board>();
        try {
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, boardid);
            pstmt.setInt(2, (pageInt - 1) * limit + 1);
            pstmt.setInt(3, (pageInt) * limit);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                Board b = new Board(
                        rs.getInt("num"),
                        rs.getString("writer"),
                        rs.getString("pass"),
                        rs.getString("subject"),
                        rs.getString("content"),
                        rs.getString("file1"),
                        rs.getString("boardid"),
                        rs.getDate("regdate"),
                        rs.getString("ip"),
                        rs.getInt("readcnt"),
                        rs.getInt("ref"),
                        rs.getInt("reflevel"),
                        rs.getInt("refstep"));
                li.add(b);
            } ;
            return li;


        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JdbcConnection.close(con, pstmt, rs);
        }
        return null;
    }


    public Board boardOne(int id) {

        Connection con = JdbcConnection.getConnection();
        PreparedStatement pstmt = null;
        String sql = "select * from board where num = ?";
        ResultSet rs = null;
        try {
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, id);
            rs = pstmt.executeQuery();
            // row가 한개임
            while (rs.next()) {

                Board m = new Board();
                m.setNum(rs.getInt("num"));
                m.setWriter(rs.getString("writer"));
                m.setPass(rs.getString("pass"));
                m.setSubject(rs.getString("subject"));
                m.setContent(rs.getString("content"));
                m.setFile1(rs.getString("file1"));
                m.setRef(rs.getInt("ref"));
                m.setRefstep(rs.getInt("refstep"));
                m.setReflevel(rs.getInt("reflevel"));
                m.setReadcnt(rs.getInt("readcnt"));
                m.setRegdate(rs.getDate("regdate"));
                return m;
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JdbcConnection.close(con, pstmt, rs);
        }
        return null;
    }

    public int boardUpdate(Board board) {
        Connection con = JdbcConnection.getConnection();
        PreparedStatement pstmt = null;
        String sql = "update board set subject=?, content=?, file1=?"
                + " where num = ?";

        try {
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, board.getSubject());
            pstmt.setString(2, board.getContent());
            pstmt.setString(3, board.getFile1());
            pstmt.setInt(4, board.getNum());
            return pstmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JdbcConnection.close(con, pstmt, null);
        }

        return 0;
    }

    public void readCountUp(int num) { //board num이 들어오면 readcnt++
        Connection con = JdbcConnection.getConnection();
        PreparedStatement pstmt = null;
        String sql = "update board set readcnt = readcnt+1"
                + " where num = ?";

        try {
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, num);
            pstmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JdbcConnection.close(con, pstmt, null);
        }
    }


    public int deleteBoard(int num) {
        Connection con = JdbcConnection.getConnection();
        PreparedStatement pstmt = null;
        String sql = "delete board "
                + " where num = ?";

        try {
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, num);
            return pstmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JdbcConnection.close(con, pstmt, null);
        }
        return 0;
    }

}
