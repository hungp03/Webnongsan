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
@Table(name = "Ward", schema = "dbo", catalog = "DB_Webns")
public class Ward {
	@Id
	@Column(name = "WardID", unique = true, nullable = false)
	private int wardId;

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "DistrictID", nullable = false)
	private District district;

	@Column(name = "Name", nullable = false)
	private String name;

	@OneToMany(fetch = FetchType.EAGER, mappedBy = "ward")
	private Set<Address> addresses = new HashSet<>(0);

	public Ward() {
	}

	public Ward(int wardId, District district, String name) {
		this.wardId = wardId;
		this.district = district;
		this.name = name;
	}

	public Ward(int wardId, District district, String name, Set<Address> addresses) {
		this.wardId = wardId;
		this.district = district;
		this.name = name;
		this.addresses = addresses;
	}

	public int getWardId() {
		return this.wardId;
	}

	public void setWardId(int wardId) {
		this.wardId = wardId;
	}

	public District getDistrict() {
		return this.district;
	}

	public void setDistrict(District district) {
		this.district = district;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Set<Address> getAddresses() {
		return this.addresses;
	}

	public void setAddresses(Set<Address> addresses) {
		this.addresses = addresses;
	}

}