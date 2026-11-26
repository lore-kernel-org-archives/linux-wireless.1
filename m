Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795683334;
	b=vpkhZVg4t6yKYc4ibLyOxGajwRl8uU9CV9pi4VPCKmLpuOwQz/mp+gukkL73cUfN8eyy
	 xsYzTd74phDyhEH3EFEm8Ww2NCx7F/G6PHbqB6VmOVSSqfhOc+cyMeW+CNE882ClTXijQ
	 pBcnxq2X/ZvHQaoIvHCULGhBxDBqRPFBj1c9D9bDWuCxfNzu3PCOLRvDWnV4cFcgZ3Iqj
	 SQaBiJjKUEZSYXjCQg0wDKqs0ken3JEqtscoRH5SeSN3YOU4Tv2FBZm8BYR0cSKm7+Qz/
	 /X4JSMYvgkISN4UDZXWtIO/uy0SWwb+NLF6fpA5zcl/rcbDlzDwKCfyBAeS7TG/p1YQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795683334;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Bzav8hbHWx8qr7iHvERvCUTKovwC54I1wXN/x0QQZHM=;
	b=1qi1k60X9iFHL/kxjQIeIvmSy8etmhX1hxyWr9sVlOWS4Pz/MTTMUJv1F0Ihb5uARf0p
	 aZIIh5aGR7qJ+arOhjz4haZAMoRvYLdZdOvGLmTL8n6e+NhYPtT70ShM+m2z7+Jk7YYWk
	 IQ4/4V/+831oFWW3eNsx2NQfbGdHZv0CobfrpUBTd0tRw4/Os/6Cc6tM7gWDkErSCnAGJ
	 nQLK2YInRXGtKBMELDZYfAIS6X39NnBUyn6IdHjAcsZ7WcTUmrNeCwDink7IVU1sp0E1C
	 MeC+3H09ExzLOZ94k3vpdT1HGIWuxwA7mOtlJSkTPUi6a0rIGeY3DckegPckD/AyAxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PjTKbw32;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="id6UvTJ/";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BD05606A332
	for <linux-wireless@vger.kernel.org>; Thu, 26 Nov 2026 08:55:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9BD05606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PjTKbw32;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=id6UvTJ/
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ7AuND2594835
	for <linux-wireless@vger.kernel.org>; Thu, 26 Nov 2026 08:55:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Bzav8hbHWx8qr7iHvERvCUTKovwC54I1wXN/x0QQZHM=; b=PjTKbw32XkzJBlR9
	YATVPukDjR3qnAcLBlXqs/vYXY5i6DmdhVg+KzDe8AApFHEBoZjWgsS2rUIejWmf
	fFmz1jZKtiHf1vlFEPSfX+WO8LgMetiqixuyCpWSdwvb//dBoQViXOVeTCEPJlDf
	zFi0Fum/lhciSLOIOZlmSJjW0lEjAjvWkdcGDjiLLtmZsZgUP+x9WrYXRC5VtFM8
	i7B4vlW+zDGYdrK+PVsdzAc0Z7eX4phduPwKsv8C1gHzYGhxP2rKvcaz81veWjN7
	tg9exfkBcSWbc6CBRl7zXX/HmzOekOjKL4xm+0pX8YmuRSmcvQHkkWbA0BFfQuhb
	odmC1g==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j662saaa9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Thu, 26 Nov 2026 08:55:32 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cdb8c46e240so4046434a12.1
        for <linux-wireless@vger.kernel.org>; Thu, 26 Nov 2026 00:55:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795683332; x=1796288132; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Bzav8hbHWx8qr7iHvERvCUTKovwC54I1wXN/x0QQZHM=;
        b=id6UvTJ/hURLNayHXb0VRhd6ev13UZBo23YyRL0cUaJf9Jl9z/9fwmtOQaMrWqidHV
         0nEsmTTfBHZX/u7Bg/+rA1ZWwJlHx1ZE66CPWSNkuP9LZ/reL970cuJxfwr1uyw4NIID
         cMOh3cFWZzk0nWKL8jk5gfAWl5P4VD9hRar53SrSe6XeaadIsR5wbnLOYjWyFxdMSmab
         jFAu1x4k5n567hdbr1UXWAi9sJm/qapzaen9iHQSj0emjD5W8A8yGr1wyaeoTZ8xVrCK
         Pq7A8wf1GUW7zThbcygsHDoIYLis3gxPc+skBabd8ygeKU3NCOz+zfzbN4ZualmCNLRL
         CMZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795683332; x=1796288132;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Bzav8hbHWx8qr7iHvERvCUTKovwC54I1wXN/x0QQZHM=;
        b=gpcbiX8848qGDcQ+7w1N09PkPYDg+Bfn5VvKDjtYE79j9w8sOtnj385543dZ99/M9w
         tm/EH6T4hiCY0TeLfh8IYm9d+KXg+86bPDbS7H0PBjHdF7r6NusfZpLClXwxvY6iVa7h
         j9XDc1lwZ7JBRxaR+CjnAbBxTdnRVpO2hFh2cxEGL1c9urkSgioTaLaiQqVrzu3pFcdG
         HBRz2shXiKqlRVoydVU67h0O6r14NMkWetluJSNVvrvz0RQMlXsyWDFa/Iv91ADL+CnC
         Bv6YlWjZzOW6KBV7DRTjisMBsuXyMQ5GRpW+PzbzLhHigfaVbrL1qfgRv45OOf9i3Kf/
         S2zw==
X-Forwarded-Encrypted: i=1; AL+hErEutyONrXXp5Lmds5pWiojlg/SQHMJgGqgmj1cvJTqWcWXFW1bQC+GCa9rSdecxrZO502CEHwR8hOiEYQlqCA==@vger.kernel.org
X-Gm-Message-State: APuU4Z/2PPglaLErNFKxzA/I3SkCyKV/xssvoBN40aMWdanjnEafvffs
	K1pV4DrjNjw3sMw26iYq9JZrD+rFAqrKypvFnFiKrbd7Cp3qrWyBfQF0Caci5D/yCpRjY4IDGRO
	xd5Ey2x31ELcHVVWwxVg8ws8KWiwSSBQj63vOYcXGGUgj41pkdFNEfWoT2KQaoFozllbY6K/vRy
	dDNg==
X-Gm-Gg: AZFdTZfVU6PnBPn4tXBUWJWWNVjuNC2ha67NdGEs16M+1XOI2+Nmi8EnxxsMo4j0Yo5
	gqTp4FW0YOJmUbh2h7JfXTkV9Nv06wPUj2fP3lwjLFwylzG8BFok37yqphap9tLTVqDyaPuKbxA
	Zv9HjKMHDKPA8b6bc7MdqJPYIpCDmFJxWz6JwXGMhbSGdmjwicM5VsIiDV1g4InURc53BCdX4aZ
	HALx94xsRMU4bel3+RL44hNAfWntwS3oTdUtcZNJruZqTUIjyiKS7ZEQa6/exHihhQGzReIMr6+
	r5apEhHQKptdzlzdaOim/Oc4d6o2riPLRg1VgE74k0IbAJ8cS3iGelx9zf+ObI5sWC4Im8Ogeez
	+ENDOqEMx0tTrZEgJ2ivvdAMrNgW7oVHMQP2uGl4YfhonsSs0IWw3TmR4W/O62wjThy1Ju3OjfJ
	F6t2wqKNy7ucuQES1yxUX2OWzDjK8jeGE5YU93RnIzB+88
X-Received: by 2002:a05:6a20:a10e:b0:3fb:2d3e:e602 with SMTP id adf61e73a8af0-4014db57a6bmr22570653637.33.1795683332040;
        Thu, 26 Nov 2026 00:55:32 -0800 (PST)
X-Received: by 2002:a05:6a20:a10e:b0:3fb:2d3e:e602 with SMTP id adf61e73a8af0-4014db57a6bmr22570632637.33.1795683331504;
        Thu, 26 Nov 2026 00:55:31 -0800 (PST)
Received: from [10.133.33.161] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c872951febsm10293728b3a.14.2026.11.26.00.55.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 00:55:31 -0800 (PST)
Message-ID: <0bf1ebed-90fd-4f88-a5d8-e768d7278b12@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 16:55:28 +0800
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next 3/7] wifi: ath12k: fix
 ath12k_mac_op_change_vif_links() for active-link updates
To: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>,
        jjohnson@kernel.org
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261118025520.39269-1-miaoqing.pan@oss.qualcomm.com>
 <20261118025520.39269-4-miaoqing.pan@oss.qualcomm.com>
 <e5864418-b181-40b9-8718-2815d84d453e@oss.qualcomm.com>
Content-Language: en-US
From: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
In-Reply-To: <e5864418-b181-40b9-8718-2815d84d453e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=B54sQ+tM c=1 sm=1 tr=0 ts=6b07f404 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=lRClungnl63yzTEoqPgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: QHakFc0gF9XyUrODxyjl_jHy5WQdkIbJ
X-Proofpoint-ORIG-GUID: QHakFc0gF9XyUrODxyjl_jHy5WQdkIbJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAzNCBTYWx0ZWRfX6t8eg0AxDKSZ
 ZEG4OS0jZs07RvP8oKSiwXQ8tcF2jvpAS6uwk6vuGFK4r7Ikd/WLK+0Kje3jVYcdEAwBgCGEHaV
 N7cWxxPYrEz5SqGeZFt7/ppa+sOy3K4xFyCFRCAUWLyGsBEd7/eVRXujVyx8hkMPlI6HF3ra/Wr
 OrQvqnekN0H99dZBAhEiGSGT6OIqq0OquWhIPU/ECrvJcaNIjND+7pHbY6OjU5cfYT3BJIFBwb2
 VGhvIH76cGs5PE8UbZMChNX6sNzf+pvQheE6FYJl/1/Eg2811SMiLm0zSww4UGPtBF3qXcrqHdp
 I7n0cs+pB4+YK96aey9y5DvuSyBdDme7x7nUmLQU38ML8Uo3Flm60T79rVenX3n9Qd1+bC9EEDk
 n1dNJH9VMRVSdPRZEITi1GTX5LohgJFzalTDADSq9SFAWNxhki/vECTd3H8lDseBoMftWNCxNTl
 prkyk7SAikCc68QCVRA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAzNCBTYWx0ZWRfX8SNpfEaHQWzO
 vJQrh6JGc80EVkoQfl0/tF8ZoqDSYqwwoTVmMvWqLyo0l8okNXoLM80hvLgD6nrNJgcGLl0gxQE
 Mpv8JKuGgIWRO9CXlCc5R0hcqs8iXBk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 phishscore=0 clxscore=1015 malwarescore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260034



On 11/25/2026 5:19 AM, Rameshkumar Sundaram wrote:
> On 11/18/2026 8:25 AM, Miaoqing Pan wrote:
>> Currently, ath12k_mac_op_change_vif_links() derives the links to add and
>> remove from the old_links/new_links arguments: it creates a link vif
>> (arvif) for each link in ~old_links & new_links and frees the arvif of
>> each link in old_links & ~new_links.
>>
>> However, mac80211 invokes drv_change_vif_links() both when the valid
>> links change and when the active links change. In the first case
>> old_links/new_links are the valid links. In the second case they are
>> only the active links, while vif->valid_links is not modified. A link
>> that is deactivated is therefore reported as removed, although it is
>> still a valid link of the MLD.
>>
>> To fix this, derive the arvif lifetime from vif->valid_links, which
>> mac80211 updates before calling the driver and which an active-link
>> change leaves untouched. Create an arvif for each link in
>> valid_links & ~links_map and remove those in links_map & ~valid_links.
>> A link that is only deactivated keeps its arvif. On disconnect
>> (valid_links == 0) every remaining arvif is removed. The WARN_ON() for
>> adding a link that already has an arvif is dropped, since links already
>> in links_map are not selected for creation.
>>
>> Tested-on: QCC2072 hw1.0 PCI WLAN.COL.1.0.c2-00277- 
>> QCACOLSWPL_V1_TO_SILICONZ-1
>> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108- 
>> QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3
>>
>> Fixes: 315d80be304a ("wifi: ath12k: allocate new links in 
>> change_vif_links()")
>> Signed-off-by: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
>> ---
>>   drivers/net/wireless/ath/ath12k/mac.c | 18 +++++++++---------
>>   1 file changed, 9 insertions(+), 9 deletions(-)
>>
>> diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/ 
>> wireless/ath/ath12k/mac.c
>> index 3f106ac6141c..28cb549b1f46 100644
>> --- a/drivers/net/wireless/ath/ath12k/mac.c
>> +++ b/drivers/net/wireless/ath/ath12k/mac.c
>> @@ -4377,9 +4377,8 @@ ath12k_mac_op_change_vif_links(struct 
>> ieee80211_hw *hw,
>>                      struct ieee80211_bss_conf 
>> *ol[IEEE80211_MLD_MAX_NUM_LINKS])
>>   {
>>       struct ath12k_vif *ahvif = ath12k_vif_to_ahvif(vif);
>> -    unsigned long to_remove = old_links & ~new_links;
>> -    unsigned long to_add = ~old_links & new_links;
>>       struct ath12k_hw *ah = ath12k_hw_to_ah(hw);
>> +    unsigned long to_remove, to_add;
>>       struct ath12k_link_vif *arvif;
>>       u8 link_id;
>> @@ -4389,14 +4388,15 @@ ath12k_mac_op_change_vif_links(struct 
>> ieee80211_hw *hw,
>>                  "mac vif link changed for MLD %pM old_links 0x%x 
>> new_links 0x%x\n",
>>                  vif->addr, old_links, new_links);
>> -    for_each_set_bit(link_id, &to_add, IEEE80211_MLD_MAX_NUM_LINKS) {
>> -        arvif = wiphy_dereference(hw->wiphy, ahvif->link[link_id]);
>> -        /* mac80211 wants to add link but driver already has the
>> -         * link. This should not happen ideally.
>> -         */
>> -        if (WARN_ON(arvif))
>> -            return -EINVAL;
>> +    /*
>> +     * Link objects follow vif->valid_links, which mac80211 updates 
>> before
>> +     * calling us. old_links/new_links only describe the active links 
>> and
>> +     * must not be used to decide object lifetime.
>> +     */
> 
> This seems quite ambiguous from the mac80211 code flow,
> 
> Consider a 2-link STA associated with an AP, where one link is removed 
> by the AP:
> wlan0: MLO Reconfiguration: work: valid=0x3, removed=0x2
> 
> In ieee80211_ml_reconf_work(),
> Initially:
> valid_links = 0x3
> active_links = 0x3
> 
> ieee80211_set_active_links() first removes the link from active_links:
> valid_links = 0x3
> active_links = 0x1
> 
> This calls drv_change_vif_links() with 0x3 -> 0x1, but ath12k would not 
> remove the corresponding arvif/arsta since vif->valid_links is still 0x3.
> 
> Subsequently, ieee80211_vif_set_links() removes the link from valid_links:
> valid_links = 0x1
> active_links = 0x1
> 
> However, the call to drv_change_vif_links() uses:
> old_links & old_active
> new_links & sdata->vif.active_links
> 
> which evaluates to:
> 0x3 & 0x1 = 0x1
> 0x1 & 0x1 = 0x1
> Since old_links == new_links, drv_change_vif_links() returns without 
> calling the driver.
> 
> After this, mac80211 removes/frees its link object, while ath12k still 
> seems to retain the corresponding arvif/arsta. Is this expected?
> 

This is expected: with this patch, the arvif of a removed link is kept 
for the rest of the connection. It is not leaked. The vdev of that link 
is not deleted at that point because deleting the vdev of a single link 
of an ML association makes the firmware crash. When the connection is 
torn down, valid_links becomes 0. ath12k_mac_op_change_vif_links() then 
removes every arvif left in links_map, including the one of the removed 
link. The debug log shows mac remove link interface and vdev ... deleted 
for both vdevs.

