package com.xdylpg.service;

import java.util.ArrayList;
import java.util.List;

import com.xdylpg.ORM.Comconsor;

public interface ComConSortService {
	public List<Comconsor> browseCCS();
	public List<Comconsor> listChildCCS(Comconsor ccs);
	public ArrayList<Comconsor> listChildCCS(int fid);
	public List<Comconsor> listParents();
	public Comconsor loadParentCCS(int id);
	/** load company content sort */
	public Comconsor loadCCS(int id);
	public boolean deleteCCS(int id);
	public boolean saveOrUpdateCCS(Comconsor ccs);
}
