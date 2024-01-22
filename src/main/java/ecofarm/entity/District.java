package ecofarm.entity;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "District", schema = "dbo", catalog = "DB_Webns")
public class District {
	@Id

	@Column(name = "DistrictID", unique = true, nullable = false)
	private int districtId;

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "ProvinceID", nullable = false)
	private Province province;

	@Column(name = "Name", nullable = false)
	private String name;

	@OneToMany(fetch = FetchType.EAGER, mappedBy = "district")
	private Set<Ward> wards = new HashSet<>(0);

	public District() {
	}

	public District(int districtId, Province province, String name) {
		this.districtId = districtId;
		this.province = province;
		this.name = name;
	}

	public District(int districtId, Province province, String name, Set<Ward> wards) {
		this.districtId = districtId;
		this.province = province;
		this.name = name;
		this.wards = wards;
	}

	public int getDistrictId() {
		return this.districtId;
	}

	public void setDistrictId(int districtId) {
		this.districtId = districtId;
	}

	public Province getProvince() {
		return this.province;
	}

	public void setProvince(Province province) {
		this.province = province;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Set<Ward> getWards() {
		return this.wards;
	}

	public void setWards(Set<Ward> wards) {
		this.wards = wards;
	}

}
