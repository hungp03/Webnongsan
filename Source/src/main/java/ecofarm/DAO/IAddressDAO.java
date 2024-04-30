package ecofarm.DAO;

import java.util.ArrayList;
import java.util.List;

import ecofarm.entity.Account;
import ecofarm.entity.Address;
import ecofarm.entity.Province;
import ecofarm.entity.Ward;

public interface IAddressDAO {
	public ArrayList<Province> getProvinceList();

	public Account fetchAddressAccount(Account account);

	public Address getAddress(int id);

	public boolean insertAddress(Account account, Address address);

	public boolean updateAddress(Address address);

	public boolean deleteAddress(Address address);

	public List<Address> getAddressesByAccountId(int accountId);

	public Ward getWard(int id);
}

