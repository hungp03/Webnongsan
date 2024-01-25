package ecofarm.entity;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;


@Entity
@Table(name = "Province", schema = "dbo", catalog = "DB_Webns")
public class Province {

	@Id
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