package br.com.sprintters.prettystyle.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;

import br.com.sprintters.prettystyle.model.Client;

public class ClientDAO {
	public int insert(Client to) throws Exception {
		int id = 0;
		String sqlInsert = "INSERT INTO client (name, surname, cpf, birthday, genre, id_user, created_at) VALUES (?, ?, ?, ?, ?, ?, NOW())";
		
		try (Connection conn = ConnectionFactory.createConnection();
			 PreparedStatement stm = conn.prepareStatement(sqlInsert)) {
			stm.setString(1, to.getName());
			stm.setString(2, to.getSurname());
			stm.setString(3, to.getCpf());
			stm.setDate(4, new java.sql.Date(to.getBirthday().getTime()));
			
			if (to.getSex().equals("on")) {
				to.setSex("M");
			} else  {
				to.setSex("F");
			}
			
			stm.setString(5, to.getSex());
			stm.setInt(6, to.getIdUser());
			
			stm.execute();
			
			try (ResultSet rs = stm.executeQuery("SELECT LAST_INSERT_ID()")) {
				if (rs.next()) {				
					id = rs.getInt(1);
					to.setId(id);
				}
			} catch (SQLException ex) {
				throw new Exception(ex.getMessage());
			}
		} catch (SQLException e) {
			throw new Exception(e.getMessage());
		}
		
		return id;
	}
	
	public void update(Client to) throws Exception {
		String sqlUpdate = "UPDATE client SET name = ?, surname = ?, cpf = ?, birthday = ?, genre = ?, updated_at = NOW() WHERE id = ?";
		
		try (Connection conn = ConnectionFactory.createConnection();
			 PreparedStatement stm = conn.prepareStatement(sqlUpdate)) {
			stm.setString(1, to.getName());
			stm.setString(2, to.getSurname());
			stm.setString(3, to.getCpf());
			stm.setDate(4, new java.sql.Date(to.getBirthday().getTime()));
			stm.setString(5, to.getSex());
			stm.setInt(6, to.getId());
			
			stm.execute();
			
			conn.close();
			
		} catch (SQLException e) {
			throw new Exception(e.getMessage());
		}
	}
	
	public void delete(Client to) throws Exception {
		String sqlDelete = "UPDATE client SET deleted_at = NOW() WHERE id = ?";
		
		try (Connection conn = ConnectionFactory.createConnection();
			 PreparedStatement stm = conn.prepareStatement(sqlDelete)) {
			stm.setInt(1, to.getId());
			
			stm.execute();
			
		} catch (SQLException e) {
			throw new Exception(e.getMessage());
		}
	}
	
	public Client find(int id) throws Exception {
		Client to = new Client();
		String sqlSelect = "SELECT * FROM client WHERE id = ?";
		
		try (Connection conn = ConnectionFactory.createConnection();
			 PreparedStatement stm = conn.prepareStatement(sqlSelect)) {
			stm.setInt(1, id);
			
			try (ResultSet rs = stm.executeQuery()) {
				if (rs.next()) {
					to.setId(rs.getInt("id"));
					to.setName(rs.getString("name"));
					to.setSurname(rs.getString("surname"));
					
					Calendar c = Calendar.getInstance();
					c.setTime(new java.util.Date(rs.getDate("birthday").getTime()));
					c.add(Calendar.DATE, 1);
					
					to.setBirthday(c.getTime());
					to.setBirthdayStr(new SimpleDateFormat("dd/MM/yyyy").format(c.getTime()));
					
					to.setIdUser(rs.getInt("id_user"));
					to.setCreatedAt(rs.getTimestamp("created_at"));
					to.setUpdatedAt(rs.getTimestamp("updated_at"));
					to.setDeletedAt(rs.getTimestamp("deleted_at"));
				}
			} catch (SQLException ex) {
				throw new Exception(ex.getMessage());
			}
		} catch (SQLException e) {
			throw new Exception(e.getMessage());
		}
		
		return to;
	}
	
	public Client findByIdUser(int idUser) throws Exception {
		Client to = null;
		String sqlSelect = "SELECT * FROM client WHERE id_user = ?";
		
		try (Connection conn = ConnectionFactory.createConnection();
			 PreparedStatement stm = conn.prepareStatement(sqlSelect)) {
			stm.setInt(1, idUser);
			
			try (ResultSet rs = stm.executeQuery()) {	
				if (rs.next()) {
					to = new Client();
					to.setId(rs.getInt("id"));
					to.setName(rs.getString("name"));
					to.setSurname(rs.getString("surname"));
					
					Calendar c = Calendar.getInstance();
					c.setTime(new java.util.Date(rs.getDate("birthday").getTime()));
					c.add(Calendar.DATE, 1);
					
					to.setBirthday(c.getTime());
					to.setBirthdayStr(new SimpleDateFormat("dd/MM/yyyy").format(c.getTime()));
					
					to.setCpf(rs.getString("cpf"));
					to.setSex(rs.getString("genre"));
					to.setIdUser(rs.getInt("id_user"));
					to.setCreatedAt(rs.getTimestamp("created_at"));
					to.setUpdatedAt(rs.getTimestamp("updated_at"));
					to.setDeletedAt(rs.getTimestamp("deleted_at"));
				}
				
				conn.close();
			} catch (SQLException ex) {
				throw new Exception(ex.getMessage());
			}
		} catch (SQLException e) {
			throw new Exception(e.getMessage());
		}
		
		return to;
	}
	
	public ArrayList<Client> list() throws Exception  {
		ArrayList<Client> clients = new ArrayList<Client>();
		String sqlSelect = "SELECT * FROM client WHERE deleted_at IS NULL";
		
		try (Connection conn = ConnectionFactory.createConnection();
			 PreparedStatement stm = conn.prepareStatement(sqlSelect)) {
			try (ResultSet rs = stm.executeQuery()) {
				while (rs.next()) {
					
					Calendar c = Calendar.getInstance();
					c.setTime(new java.util.Date(rs.getDate("birthday").getTime()));
					c.add(Calendar.DATE, 1);
					
					Client to = new Client(
						rs.getInt("id"),
						rs.getString("name"),
						rs.getString("surname"),
						rs.getString("cpf"),
						c.getTime(),
						rs.getString("sex"),
						rs.getInt("id_user"),
						rs.getTimestamp("created_at"),
						rs.getTimestamp("updated_at"),
						rs.getTimestamp("deleted_at")
					);
					
					to.setBirthdayStr(new SimpleDateFormat("dd/MM/yyyy").format(c.getTime()));
					
					clients.add(to);
				}
				
				conn.close();
			} catch (SQLException ex) {
				throw new Exception(ex.getMessage());
			}
		} catch (SQLException e) {
			throw new Exception(e.getMessage());
		}
		
		return clients;
	}
}
