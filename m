Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794841211;
	b=Vyt5PfruWDlWh4y0EE1CBkqBsky1Sas2MqkR6mPX9lWsn/PiLlAzkYslgSfbwxUGGJVn
	 Txgj7yQfuvziYjFFAONH4blY019/fW06hyQJMWZT6IUuwVNfLH9gJhibRofCwMx/UUqtO
	 4EMa5MDWQPc7CdNPLgMD6Kh6Mnq76ZxCIAlpzL6g9/ifo/v2FAetGUzjr+lKjA6Yzybin
	 Ycz7FgNH57Gt3gWDQGIR0OD2XYK52Mi1O/4M2OLDmuxGn9UVnh6T1mZTHFWhuOLweuuIo
	 hPUlfl4wlJxOjCu/oG7TqXBqZn/D393lXmozHIjwcz3iM1oOmLPArUzP7kVOkRZmk0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794841211;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:From:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=RXX9heQMcXNO+PaZ4fu18kUBd3r5eQ/qywO4uLhdcVk=;
	b=tptoO4P3yQ0JZ1Uv44eqTcoVDqON1bVSQCWlpv52/tq0NEuJZnvHByeXfoddt1TekYIh
	 LJyRtemhnBloAf8D9fRyEFQ1m+qd5MmcoZjLAtbsUso4nVwbiMELz5mEu/keKwgqcn0xj
	 D3577/0RFRnNNKwNTixwkz76rYt730Q84TFt0xkLcLKNec98cfBkq0ROecUoAimWX1n9s
	 b/2bmJVSIdadopBMG5P6MjJzAAz32ijCenQdE6WSdLk5Dcs2MFcwJctI+J10kQNfFo96K
	 m7m9TkeXswTi82qWUiBMIyejfzAKytcRKufZGVdjAmVomQ2SehD0XVZFQJOo18X1iLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ChRX1BFy;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BRhB7I8+;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6063606A323
	for <linux-wireless@vger.kernel.org>; Mon, 16 Nov 2026 15:00:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A6063606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ChRX1BFy;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BRhB7I8+
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AGDrTdn1249281
	for <linux-wireless@vger.kernel.org>; Mon, 16 Nov 2026 15:00:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RXX9heQMcXNO+PaZ4fu18kUBd3r5eQ/qywO4uLhdcVk=; b=ChRX1BFy2FuBC2wv
	GnoWRv2rK6t1JIBQ8R0clsS10kzhUo+TE2gSMk/o/sRjDxK3yKEyVYWMOyXAFS5W
	ER9y2zR9uMtHZPkuJNQYa2HczEapMFKGMbg+WrOX6y5jY/apt51240IWCf7tSC5v
	c6WZcr1XILQTo8EHCmEQ5nw3ojCxS2YiIcGOux+OF8nr6Z7MlNufWgzYoOu9y7kD
	FdnG2BuKmXMpc4kzCQpMn4O8YHbM2wpzP6AZ4tX7eHHFpNZexT6qFERV3dwCH1FY
	dmRM0d5lnFRr+iFbKZfp5LRkyv5YSz/G1m1Kd2kzk5QVQRGOVz34MQnzob8e9iNW
	q4SCyA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j000g0yvm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Mon, 16 Nov 2026 15:00:09 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-375bac6bd21so2855975eec.0
        for <linux-wireless@vger.kernel.org>; Mon, 16 Nov 2026 07:00:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794841209; x=1795446009; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RXX9heQMcXNO+PaZ4fu18kUBd3r5eQ/qywO4uLhdcVk=;
        b=BRhB7I8+Musb0LXMhb2GIe5HNIc3lF2UW2+NPILqN70Uaip95Jr8sjhYtVBUkkH1Uj
         LnAusA1j4rgb4Fy9xcNTWTUi8CNitgUk9KiooQ/7zFxbO1/KU116JEb4JVgWnr+nQdzF
         uKmuD2QyHiPj8/gNVK7BJE2NZ1xnbWNQDMpqQ9+8tIU1CKR7G+sC9LIijezqWpUOv/Ox
         SD04yYlloRDT4UOPkvoashsqvMV0WiyZudUeO5M7MtqPF1qSO9pLzuWDzBfeGBvOfEVD
         P+wagwtmY8Ll5Y+HEzPivMjssMV638zTmsLlmTrmNP4AoRV/Gh0fGdg1c9GR2Y0rN2Su
         8crg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794841209; x=1795446009;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RXX9heQMcXNO+PaZ4fu18kUBd3r5eQ/qywO4uLhdcVk=;
        b=smOe2iKO0WuKLbWB5vhxnXM/SGg9DqZE7DSdfPgDA39YFclrkBwnafnHxCyjKb7RYm
         ODchcRzACRdbaw5NpBT4eCuP05kpKoFgHbbBLXXPwtwBQcNEps/6zXcDnpWiqnNZ3VlK
         kkfkWAhBp3U7S5wYvZZWTD0djtWTDHzPtGtqorzEvqYXm1xI1Kc679DNFaIZtuUOES1i
         20/riEueziWutDVZYvT+0mAQL0Je5/9N8KSt4EIyCJxMpIk82xOlUi4zq6o++IB+i2o4
         WneN6E0gr33gntidMLmtnL1YGCLWSCN3JL398RcbEtgroS3AHSU2jp1KXEVl8Ao7NFGS
         VSGw==
X-Gm-Message-State: APuU4Z/eNlIBiCaxcSMYzs50wqCn5no02a2Xhq0jOl2G4wO9+KiGdhJ8
	NEzbSB0PbEiOlO5DGHbGtBNdtfLdhd27rLOz/L8K7qSd3sxXqZvGttfyYiSUnXAcegQbxh36tVz
	cGJ5SMyVE/K/NA/pvy5YYbft3OCxoXQlnSMo/Y6BCWaeA1IW7C/vjGDUKuCQELhi6MLNnBw==
X-Gm-Gg: AYBFou1dzufaBt88CQJz6d88FIXKHQ7Dd5xsMmB/+6Il5xe93aaQbYaud1/VUZWqF+k
	pqJFtxUmhjotnHC4KCQKlDMVGHcuKdwiFXni/nBikZ0d10XPiQrX2aVwjj6RuJ3Qkv+ppUsLjjA
	Af79UMjp1VF80YpUCVJzNi/hZHkMG/mxkkwepfyJnOPhSRBZanv4oHwg/jP+fyqw1TiwqAru4VB
	fyuUpYwV/i1K1HLOM8v/ZbunMRcf3YijDxWv7Ovmb6T2njxJ9X8IGyBCnfe96XxU0huc+pSQHy/
	2zgQC3jPuWa1sKeO+9JnR6mjRJyTZ0KhdGSTGtMSBsB6l5k7+CYZkAWn50Vc0iTAAPMv6E+rnlN
	eKWFPQrkcVX3ypqFFuSAPHDPyD14sBYubcmXiYgU3loJWTWjmsQYLJw+aWdWB7vWI9hXvEuuwbz
	rBbEP4Tu2NCs+5RKFNm/PTCyHSs2YQ
X-Received: by 2002:a05:7301:4718:b0:375:85ac:d14f with SMTP id 5a478bee46e88-377e10172d1mr11725390eec.14.1794841208916;
        Mon, 16 Nov 2026 07:00:08 -0800 (PST)
X-Received: by 2002:a05:7301:4718:b0:375:85ac:d14f with SMTP id 5a478bee46e88-377e10172d1mr11725347eec.14.1794841208111;
        Mon, 16 Nov 2026 07:00:08 -0800 (PST)
Received: from [192.168.1.20] (39.sub-97-215-59.myvzw.com. [97.215.59.39])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379553316fdsm35495661eec.5.2026.11.16.07.00.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 07:00:07 -0800 (PST)
Message-ID: <f7ecb009-4c95-4ef2-b569-3b2069298c41@oss.qualcomm.com>
Date: Mon, 16 Nov 2026 07:00:06 -0800
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
Subject: Re: [PATCH] wifi: ath11k: read a station's TX rate under base_lock
To: Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        christophergriffin05@gmail.com, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20261114-ath11k-sta-txrate-lock-v1-1-8331a03b1000@gmail.com>
 <a346e622-8fe9-4912-9ded-b531b1bdc82e@oss.qualcomm.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <a346e622-8fe9-4912-9ded-b531b1bdc82e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA1OSBTYWx0ZWRfXyZ/4xWjRGfKX
 dcwQIvOK8EHLI5/rbX9ohnzb+eHzbOf7yIgqyMcupYVW7BHsF2Ct5CQJPKiEANfEg5N4Do6S+Tm
 kWzGVaxObEhZ+0kUDXj3So70sMVO24tIoaEQ5W/7FbBMvOvt/DkBGofuoCAC1sdwYRfvO615iA1
 6PKa6+3y3datk7IfS6UzO8S9gqg4KBfqPbnHdFMr14Cw6dAYq75wk8K4KJHyI4vAASUW0oBzmtM
 yhnkoh9P6vg2NtqiCCaooBRHj6L+Ji7j4y6+6RD5C6rsVPt2pc0ymuFIreHNgIW4+zumUKk9V5v
 /yYLvts4bJ9TKYpvslFin9/uGlj9auMtRONxoZcAfxoAa84ImRNeAehXfZXAR39/kivETgd2lgD
 7Sg35k6ktPjF/s7ywPoNYgYABPI7qKbrLdqAoAupG1CxiUvNxR8jOnAmLYLYAwTMWJEyhmRytR5
 qyGcZXEvGJC+f8f/tUA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA1OSBTYWx0ZWRfX3Yl/THhbp4GQ
 87CuSTnIMW2kUgJ8gfw0wyUaDlqssFRr8287yQP9lt3JsQGA/+UNVVcvB7xfsQ2hPSmFufDBMV3
 VCLkmyn8VzBUiRT4xYLppTK0iP/2Uzc=
X-Proofpoint-GUID: gC4IU6Kyg7WoxYfOt2J3JyFrh1BkJhRC
X-Proofpoint-ORIG-GUID: gC4IU6Kyg7WoxYfOt2J3JyFrh1BkJhRC
X-Authority-Analysis: v=2.4 cv=Vdtir1p9 c=1 sm=1 tr=0 ts=6afb1a79 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=7UwXyAtrHAWG9Tdc5CO1EQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=pGLkceISAAAA:8 a=UiHtVcSbJgHVZnjgSQMA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_04,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 phishscore=0 suspectscore=0 priorityscore=1501 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160059

On 11/15/2026 7:03 PM, Baochen Qiang wrote:
> 
> 
> On 11/14/2026 10:34 PM, Christopher Griffin via B4 Relay wrote:
>> From: Christopher Griffin <christophergriffin05@gmail.com>
>>
>> ath11k_update_per_peer_tx_stats() and ath11k_dp_tx_update_txcompl()
>> rewrite arsta->txrate under ab->base_lock: they clear it, then fill in
>> its fields one by one. ath11k_mac_op_sta_statistics() copies it into the
>> station info without that lock, so a station dump that runs while a TX
>> status updates the rate can copy the HE flag with an nss of 0, and
>> cfg80211 warns:
>>
>>   WARNING: CPU: 3 PID: 30429 at net/wireless/util.c:1581 ieee80211_get_vht_max_nss+0x474/0x868 [cfg80211]
>>   Call trace:
>>    ieee80211_get_vht_max_nss+0x474/0x868 [cfg80211] (P)
>>    cfg80211_calculate_bitrate+0x1e0/0x4f4 [cfg80211]
>>    nl80211_put_sta_rate+0x50/0x1230 [cfg80211]
>>    nl80211_put_sta_rate+0xa30/0x1230 [cfg80211]
>>    nl80211_dump_station+0x4b8/0x7e0 [cfg80211]
>>
>> (the line is the nss check in the inlined
>> cfg80211_calculate_bitrate_he()). It was seen once in about a day on an
>> IPQ8074 AP whose stations are dumped periodically by a monitoring agent.
>>
>> Copy the rate under base_lock and report from the copy, as ath12k reads
>> its peer rate info under its DP lock.
>>
>> The change and this message were written with Claude, an AI coding
>> assistant.
>>
>> Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.9.0.1-02146-QCAHKSWPL_SILICONZ-1
>> Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.5.r4-00683-QCAHKSWPL_SILICONZ-1
>> Tested-on: IPQ6018 hw1.0 AHB WLAN.HK.2.5.0.1-03982-QCAHKSWPL_SILICONZ-3
>>
>> Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
>> Signed-off-by: Christopher Griffin <christophergriffin05@gmail.com>
>> ---
>> Found on an Arista C-360 (IPQ8074 + QCN9074) running OpenWrt, from a
>> warning in its kernel log; the cause was found by reading the code.
>> ath12k already reads its peer rate info under its DP lock.
>> ---
>>  drivers/net/wireless/ath/ath11k/mac.c | 26 ++++++++++++++++----------
>>  1 file changed, 16 insertions(+), 10 deletions(-)
>>
>> diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
>> index 1a237adaa37d1..d76eeb1ca0019 100644
>> --- a/drivers/net/wireless/ath/ath11k/mac.c
>> +++ b/drivers/net/wireless/ath/ath11k/mac.c
>> @@ -9425,6 +9425,7 @@ static void ath11k_mac_op_sta_statistics(struct ieee80211_hw *hw,
>>  {
>>  	struct ath11k_sta *arsta = ath11k_sta_to_arsta(sta);
>>  	struct ath11k *ar = arsta->arvif->ar;
>> +	struct rate_info txrate;
>>  	s8 signal;
>>  	bool db2dbm = test_bit(WMI_TLV_SERVICE_HW_DB2DBM_CONVERSION_SUPPORT,
>>  			       ar->ab->wmi_ab.svc_map);
>> @@ -9435,18 +9436,23 @@ static void ath11k_mac_op_sta_statistics(struct ieee80211_hw *hw,
>>  	sinfo->tx_duration = arsta->tx_duration;
> 
> arsta->rx_duration and arsta->tx_duration are u64 and are also only updated under
> ab->base_lock, so on 32-bit they can tear the same way. Since the lock is taken here
> anyway, moving those two reads into the same critical section would cost nothing, and is what
> ath12k_mac_op_link_sta_statistics() does under dp_lock.
> 
> Not a blocker, fine to leave it for a separate patch.

I'll incorporate this suggestion into the patch in my pending branch

