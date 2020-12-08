<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class M_crud extends CI_Model {

	public function show($table, $order){
		$this->db->order_by($order);
		$sql = $this->db->get($table);
		return $sql;
	}
	public function show_limit($table, $limit){
		$sql = $this->db->get($table);
		$this->db->limit($limit);
		return $sql;
	}
	public function get_max_id($table, $field, $where){
		$this->db->select_max($field);
		$this->db->where($where);
		$sql = $this->db->get($table);
		return $sql;
	}
	public function get_max_id_new($table, $field, $where){
		// $this->db->select_max($field);
		$this->db->select($field);
		$this->db->join('loket', 'transaksi.id_loket = loket.id_loket', 'left');
		$this->db->where($where);
		$this->db->where('transaksi.id_loket !=', 0);
		$this->db->order_by('panggil', 'DESC');
		$this->db->limit(1);
		$sql = $this->db->get($table);
		return $sql;
	}
	public function get_loket_new($table, $field, $where){
		// $this->db->select_max($field);
		$this->db->join('loket', 'transaksi.id_loket = loket.id_loket', 'left');
		$this->db->where($where);
		$this->db->where('transaksi.id_loket !=', 0);
		$this->db->order_by('panggil', 'DESC');
		$this->db->limit(1);
		$sql = $this->db->get($table);
		return $sql;
	}
	public function get_group_id($table, $group_by){
		$this->db->group_by($group_by);
		$this->db->order_by($group_by." DESC");
		$sql = $this->db->get($table);
		return $sql;
	}
	public function add($table, $data){
		$this->db->insert($table, $data);
	}
	public function del($table, $where){
		$this->db->where($where);
		$this->db->delete($table);
	}
	public function edit($table, $data, $where){
		$this->db->where($where);
		$this->db->update($table, $data);		
	}
	public function join($table, $join, $on, $order, $az){
		$this->db->select('*');
		$this->db->from($table);
		$this->db->join($join, $on);		
		$this->db->order_by($order, $az);
		$sql=$this->db->get();
		return $sql;
	}
	public function join_multiple($table, $join, $pq, $join1, $pq1, $order, $az){
		$this->db->select('*');
		$this->db->from($table);
		$this->db->join($join, $pq);
		$this->db->join($join1, $pq1);
		$this->db->order_by($order, $az);
		$sql=$this->db->get();
		return $sql;
	}
	public function get_id($table, $where){
		$this->db->where($where);
		$sql=$this->db->get($table);
		return $sql;
	}
	public function fetch_data($table, $field, $offset){
		empty($offset) ? $offset = 0 : $offset;

		$this->db->query("SET @no=".$offset);
		$this->db->select('*,(@no:=@no+1) AS nomor');

		if($table == "karyawan"){
			$this->db->join('loket', 'karyawan.id_loket = loket.id_loket', 'left');
			$this->db->order_by('jenis_loket', 'ASC');
			$this->db->order_by('loket', 'ASC');
		}

		if($table == "loket"){
			$this->db->order_by('jenis_loket', 'ASC');
			$this->db->order_by('loket', 'ASC');
		}

		$this->db->group_by($field);
		$this->db->order_by($field, 'DESC');

		$data = $this->db->get($table, $offset);

		return $data->result();
	}
	public function report(){
		$sql = $this->db->query('SELECT jenis_pelayanan, tgl, COUNT(id_transaksi) AS jml FROM transaksi GROUP BY tgl, jenis_pelayanan ORDER BY id_transaksi DESC');

		return $sql->result();
	}
	public function slide($limit){
		$sql = $this->db->query("SELECT * FROM agenda ORDER BY id_agenda DESC LIMIT $limit");
		return $sql;
	}

}
