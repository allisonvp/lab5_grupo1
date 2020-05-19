package sw2.lab5.Repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import sw2.lab5.Entities.RolEntity;

@Repository
public interface RolRepository extends JpaRepository<RolEntity,Integer> {

}
