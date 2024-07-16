select * from `cprtpr-dataplatform-sp1`.usviews.v_us_lot_fact limit 20

select * from  cprtpr-dataplatform-sp1.usviews.v_lot_image_damage_scores
where lot = 51145194 and lids_version='2.2.2'

with lf as (select  lot_nbr
  ,vin_nbr
  ,lot_year
  ,lot_make_cd
  ,lot_model
  ,vinlot_model
  ,grp_model
  ,damage_type_cd
  ,lot_cat_desc
  ,high_bid_amt   from cprtpr-dataplatform-sp1.usviews.v_us_lot_fact
  where lot_year>2010
  and  date(inv_dt)>'2024-01-17'
  and lot_type_cd='V'
  and primary_sod<2
  --and damage_type_cd in ('FR','RR','SD','AO','RO')
  ) ,


img as
(select * from  cprtpr-dataplatform-sp1.usviews.v_lot_image_damage_scores where
 lids_version='2.2.2' and front_bumper_assembly_left="1" )  ,

df as (select * from lf
inner join img
on
lf.lot_nbr=img.lot)

select * from df

select * from  cprtpr-dataplatform-sp1.usviews.v_lot_image_damage_scores where
 lids_version='2.2.2' and front_right_image_url="https://c-static.copart.com/ids-c-prod-lpp/0424/8fceef3db9824c4ba19ead5814eb7eb1_ful.jpg"
