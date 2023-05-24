package com.emergentes.dao;

import com.emergentes.modelo.Productos;
import com.emergentes.utiles.ConexionDB;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

public class ProductoDAOimpl extends ConexionDB implements AlmacenDAO {

    @Override
    public void insert(Productos productos) throws Exception {
        String sql = "insert into productos (descripcion, cantidad, precio, categoria) values (?,?,?,?)";
        this.conectar();
        PreparedStatement ps = this.conn.prepareStatement(sql);
        ps.setString(1, productos.getDescripcion());
        ps.setInt(2, productos.getCantidad());
        ps.setFloat(3, productos.getPrecio());
        ps.setString(4, productos.getCategoria());
        ps.executeUpdate();
        this.desconectar();
    }

    @Override
    public void update(Productos productos) throws Exception {
        String sql = "update productos set descripcion=?, cantidad=?, precio=?, categoria=? where id=?";
        this.conectar();
        PreparedStatement ps = this.conn.prepareStatement(sql);
        ps.setString(1, productos.getDescripcion());
        ps.setInt(2, productos.getCantidad());
        ps.setFloat(3, productos.getPrecio());
        ps.setString(4, productos.getCategoria());
        ps.setInt(5, productos.getId());
        ps.executeUpdate();
        this.desconectar();
    }

    @Override
    public void delete(int id) throws Exception {
        String sql = "delete from productos where id=?";
        this.conectar();
        PreparedStatement ps = this.conn.prepareStatement(sql);
        ps.setInt(1, id);
        ps.executeUpdate();
        this.desconectar();
    }

    @Override
    public List<Productos> getAll() throws Exception {
        List<Productos> lista = null;
        String sql = "select * from productos";
        this.conectar();
        PreparedStatement ps = this.conn.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();

        lista = new ArrayList<Productos>();
        while (rs.next()) {
            Productos ges = new Productos();

            ges.setId(rs.getInt("id"));
            ges.setDescripcion(rs.getString("descripcion"));
            ges.setCantidad(rs.getInt("cantidad"));
            ges.setPrecio(rs.getFloat("precio"));
            ges.setCategoria(rs.getString("categoria"));

            lista.add(ges);
        }
        this.desconectar();
        return lista;
    }

    @Override
    public Productos getById(int id) throws Exception {
        Productos ges = new Productos();
        try {
            String sql = "select * from productos where id=?";
            PreparedStatement ps = this.conn.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                ges.setId(rs.getInt("id"));
                ges.setDescripcion(rs.getString("descripcion"));
                ges.setCantidad(rs.getInt("cantidad"));
                ges.setPrecio(rs.getFloat("precio"));
                ges.setCategoria(rs.getString("categoria"));
            }
        } catch (SQLException e) {
            throw e;
        } finally {
            this.desconectar();
        }
        return ges;
    }

}
