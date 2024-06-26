package ecofarm.entity;


import java.util.HashSet;
import java.util.List;
import java.util.Set;


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;


import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;



@Entity
@Table(name = "Province", schema = "dbo", catalog = "DB_Webnongsan")
public class Province {

	@Id
	@GeneratedValue
	@Column(name = "ProvinceID", unique = true, nullable = false)
	private int provinceId;

	@Column(name = "Name", nullable = false)
	private String name;

	@OneToMany(fetch = FetchType.EAGER, mappedBy = "province")
	private Set<District> districts = new HashSet<>(0);

	public Province() {
	}

	public Province(int provinceId, String name) {
		this.provinceId = provinceId;
		this.name = name;
	}

	public Province(int provinceId, String name, Set<District> districts) {
		this.provinceId = provinceId;
		this.name = name;
		this.districts = districts;
	}

	public int getProvinceId() {
		return this.provinceId;
	}

	public void setProvinceId(int provinceId) {
		this.provinceId = provinceId;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Set<District> getDistricts() {
		return this.districts;
	}

	public void setDistricts(Set<District> districts) {
		this.districts = districts;
	}
	
}
