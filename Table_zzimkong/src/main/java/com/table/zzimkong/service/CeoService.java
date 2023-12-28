package com.table.zzimkong.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.table.zzimkong.mapper.CeoMapper;


@Service
public class CeoService {
	
	@Autowired 
	private CeoMapper mapper;
	
}
