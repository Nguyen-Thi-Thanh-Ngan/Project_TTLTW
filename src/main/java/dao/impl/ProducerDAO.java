package dao.impl;

import dao.DAOInterface;
import model.*;
import db.JDBIConnector;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

public class ProducerDAO implements DAOInterface<Producer> {
    @Override
    public List<Producer> selectAll() {
        List<Producer> producers = JDBIConnector.getConnect().withHandle((handle ->
                handle.createQuery("SELECT id, name FROM producers")
                        .mapToBean(Producer.class).stream().collect(Collectors.toList())
        ));
        return producers;
    }

    @Override
    public Producer selectById(Producer producerP) {
        Optional<Producer> producer = JDBIConnector.getConnect().withHandle((handle ->
                handle.createQuery("SELECT id, name FROM producers WHERE id=?")
                        .bind(0, producerP.getId())
                        .mapToBean(Producer.class).stream().findFirst()
        ));
        return producer.isEmpty() ? null : producer.get();
    }

    @Override
    public int insert(Producer producer) {
        int ketQua =  JDBIConnector.getConnect().withHandle(handle ->
                    handle.createUpdate("INSERT INTO producers (id, name) VALUES (:id, :name)")
                            .bindBean(producer)
                            .execute()
            );

        return ketQua;
    }

    @Override
    public int delete(Producer producer) {
        int ketQua = JDBIConnector.getConnect().withHandle(handle ->
                handle.createUpdate("DELETE FROM producers WHERE id = :id")
                        .bind("id", producer.getId())
                        .execute()
        );
        return ketQua;
    }


    @Override
    public int update(Producer producer) {
        int ketQua =  JDBIConnector.getConnect().withHandle(handle ->
                    handle.createUpdate("UPDATE producers SET name = :name WHERE id = :id")
                            .bind("name", producer.getName())
                            .bind("id", producer.getId())
                            .execute()
            );
        return ketQua;
    }


    public static Producer getById(String id) {
        Optional<Producer> producer = JDBIConnector.getConnect().withHandle((handle ->
                handle.createQuery("SELECT id, name FROM producers WHERE id=?")
                        .bind(0, id)
                        .map((rs, ctx) -> {
                            String nameProducer = rs.getString("name");
                            Producer pc = new Producer(id, nameProducer);
                            return pc;
                        }).stream().findFirst()
        ));
        return producer.isEmpty() ? null : producer.get();
    }

    public static void main(String[] args) {
        ProducerDAO pdd = new ProducerDAO();
//        Producer producer = pdd.selectById(new Producer("AP", null));
//        System.out.println(producer);
        System.out.println(getById("AK"));

    }
}
