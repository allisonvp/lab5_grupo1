package sw2.lab5.Repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import sw2.lab5.Entities.PostEntity;
import sw2.lab5.Entities.UsuarioEntity;

import java.util.List;

@Repository
public interface PostRepository extends JpaRepository<PostEntity,Integer> {

    @Query(value="SELECT id_post as idpost, title, summary\n" +
            "FROM post p\n" +
            "INNER JOIN user u ON p.author_id=u.id_user\n" +
            "WHERE published=1 and author_id=?1",nativeQuery=true)

    List<PostEntity> buscarPostPorAutor(UsuarioEntity autor);


}
