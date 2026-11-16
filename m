Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794810173;
	b=WwI6obZTiF/ESXqkSYt3LSMV9gRuAP8p7/jeNQUR9PX3Rs7HyzO/j9CMsvxyfHtDVDZs
	 j3DFp9oKsZ3mQI9ZKEXK/YYz0GABONEZEW4ppfuOur/iG9KV9H9/m/PGzkY5mmMF+taLS
	 SSbCbm8B9A9pBarPun+9KPNOEnBhWMpHf6EbIer0B/g0ZBYTk8LcI+iwzUXoq+fgVw+Cf
	 UI8mJkkLKMHobzhDkadQa/r/VWYy6uxtkXjmIMp/EAynqM16CuOL3w/L/m28IGkj4D+yW
	 6zSSYyjuRvZ99W3WyxESNrpnt11/AxmGlWx0fxUd1EJQ/GSM1UDHDfQJEEZ3cRpNItQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794810173;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:From:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=qbPyWDTGsxZxaxa888WW+RqeZR/JVWOIfYKuKKm7ekc=;
	b=nFo/3JLUKHS55DLg5/x9hE7K9ySOJOaPxNsRcmcIuMBNzk4j6tkoIipGgYKYhNfLoLkE
	 H3dmClf1VneKiVlSAMdgfH1LQjCTL4uajBK7kwv3SMv/8sP9vi4RQ7Zc8Qy5o9grByVmR
	 c2IqsJAx25SGIDZrdPEqbabB6d4FnfHhB9Mesi3TWlVKbaUOplVAGIBhUEMso3QhdyHtG
	 iDQWodSZy/DoCn1bPmlhu661TOpITyrJ5mnh6P/Aw9zBi+CeBphHhk2B7mFzfuEc0bq8B
	 5FIZwp0W1/+YSdXRBuIuv+ROQrmN+U4nVPCtd+9VES5NF1hlGuzJvp0XIe/j7hQwzZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fHokRJMB;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iDQhH2ED;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79AE3606A32F
	for <linux-wireless@vger.kernel.org>; Mon, 16 Nov 2026 06:22:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 79AE3606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fHokRJMB;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iDQhH2ED
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AG5LO3Z2880904
	for <linux-wireless@vger.kernel.org>; Mon, 16 Nov 2026 06:22:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qbPyWDTGsxZxaxa888WW+RqeZR/JVWOIfYKuKKm7ekc=; b=fHokRJMBX+dFtEVa
	Sr25bEDhpqMsMbA8mAGjJvLn9Lb5QgfDnRS7V2hPonrcDGxywUuoS4P6LzTBjXM4
	E9O776kF3o3F8jzB46f6bIXaPc3Gfo1MvFlbfd04z0M/Ps2rPlipulLi7UN/r7Tt
	4uxznC5bOPoeyT4QOekGuOknGwkd746TF3b4rMUya1qkWppLcjbqVdX5Wyi1v3k7
	IfvcXVxOEMcp+kthMfw0EUUtnbyd2/2SqYOfAclOnieHLA+X/EgBRtTARKz7x4Te
	+rLweDJd2Wf/LXvjheijv5VH1RPIxqq3h2dlYlWxkPRFO1RmS3W6JSMpQVX43nTv
	OrNwJw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhj454ds-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Mon, 16 Nov 2026 06:22:51 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ed05b3eaecso21057775ad.1
        for <linux-wireless@vger.kernel.org>; Sun, 15 Nov 2026 22:22:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794810170; x=1795414970; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qbPyWDTGsxZxaxa888WW+RqeZR/JVWOIfYKuKKm7ekc=;
        b=iDQhH2EDgsmUnLPi0ZEb37KptvWKVFnWIa+28+u477OSEvaL8USOXQhEruzP6Z9xjO
         /eR7rkaQGGckejf2Q5Oflux2r4MkSyJyk3Vh7NGFYGO3oWYJn6456z0hoXUkt+tdsdfg
         wTU28VD2zIPQLwOQEPrPqTRlFb6YzjalS5N+wEF+k5wovMKBGKrRqmj5iSipfgic72Dn
         3wKdpPavZ9ZQf1p6i6WpYTZ5VYEJLGTqIUceWv0SYxScNHFYcm8AzHTerHj5eUGPvZem
         wHN57G29xAWi3XW+2gAzh0qAiz8hHBT0ExSpzuSJASK/ME0XbrxFi3iYp4RHjSUA5Q3k
         1xug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794810170; x=1795414970;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qbPyWDTGsxZxaxa888WW+RqeZR/JVWOIfYKuKKm7ekc=;
        b=f8dN65myAOYywkv5HLZN0dEQAOrbxW3d64dQ82c1DHKkUBQrEYVx8G3Mj6xa3YP6ch
         5bgrwE0F49eEBdA0SoVM4/F9q/E04J6dpj57K4LMprjSOlg31sGcKROkybMT0F9t3aNA
         IlDwDUiwJwBXKHd71dfUStudGanXV4hwI2wVHPG+Ml8U6pCvJ7g5YmVpZlCPBW6lABCO
         ni1+iNgDnM9DYSR/lOlMcawOW5oUFo/FFlmiNe6CxEOCN3ZIDqk+m5QCQ0lvspHlKcWD
         L8pl56h7JIZI/p7KJFdy4giA3A9srlqEdl3kb2TD7tFUN1cAl4RPOXWpRwjeaPUyyBuB
         stQQ==
X-Gm-Message-State: APuU4Z8i0SWzNLW1EknsYqOAVEzIT6YmIMG5hlmJFQM20Yg7eKHHm+IM
	ChfBod+eWCdu5S1Oz9DIEs1GoRoWyBNR+xwvuL16n43NH7OH79VcWEi5bM9KhxVTeS4V4G/LU4p
	NvPnf3zpnLtfRW9sdkfe6CZdDVDCxfANb7W9llStb9EIPnki2yAKMZNLqcclovZHzagWXPg==
X-Gm-Gg: AZFdTZfN0ZNOnRvd6OWHg+/xmpmW5a6XkkcPbOD0CzMxEwbd2n6ghduoPQuSTAGx6fB
	Xar6qs+B9yX2FsMmX3ZzveUQdjezrGkHVUayLALBjgi2shh0TD5JCidykZODPJmusm6K+GPLXAn
	yhZNcD154VoZ3T/XZACnv7u2EpcQ76uJsf0td3n1X8a1UDMK49k0TLJsM78QnA02QGEw6fyQiZN
	BHYq+A6yg6d18jL4K2T6cyCT5OMXbHlNjp/zw097bI7FWECfa1Wl/RCFv0OkbBGsPr83XbobLub
	bW1gNyb9zUvuhDIckKR7K3PmJNuGqCVeNcHqMx8WxVhqP/kSbmjXHDhsJbT0J83+klhH3dFvTyg
	37pM3kvRtXUigihFRsMcklbQkmmjo1iS5pXecTD9AUSyjbXFSsrPrPLyZAGRtIFyJ729uiPS0BR
	iVq4e9PcmR/Dk7BImV58DFblRhRXtChu/IwgIGDnHi+XKW
X-Received: by 2002:a17:902:ef0c:b0:2e9:6972:54d2 with SMTP id d9443c01a7336-2ee0de12039mr97623795ad.12.1794810170170;
        Sun, 15 Nov 2026 22:22:50 -0800 (PST)
X-Received: by 2002:a17:902:ef0c:b0:2e9:6972:54d2 with SMTP id d9443c01a7336-2ee0de12039mr97623565ad.12.1794810169662;
        Sun, 15 Nov 2026 22:22:49 -0800 (PST)
Received: from [10.133.33.65] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ee0f8d9966sm33428915ad.61.2026.11.15.22.22.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Nov 2026 22:22:49 -0800 (PST)
Message-ID: <2420c657-0aee-4d8e-9c84-dd8aeb510841@oss.qualcomm.com>
Date: Mon, 16 Nov 2026 14:22:46 +0800
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
Subject: Re: [PATCH ath-next] wifi: ath12k: add hash table for peer lookup in
 struct ath12k_dp_hw
To: Aishwarya R <aishwarya.r@oss.qualcomm.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Harsh Kumar Bijlani <harsh.bijlani@oss.qualcomm.com>
References: <20261026062131.1589569-1-aishwarya.r@oss.qualcomm.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261026062131.1589569-1-aishwarya.r@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDAyNSBTYWx0ZWRfX1kSqHi1dxF/+
 4HGmpBppQ0EwMiEnzQ/olnSVa9SfjoXfwdGL9OI6EKO994DENcf6N+rNU6g0aXtevIJjFUQA+Cp
 5vl9pqWzQkQzvgffZ2lHYXaujBzv++ZpLNe3LettrzoNtin/okq8EwJTQ0EgYSzQxK+C/z5xJsA
 wQUCFtVSknbHtpx6Eh3fff2fJ8jWTuzBKP9XQLENF1Vr/fipM1G14HdQoZSDYR4a52fE/cac5HJ
 TxOVvzyj3/iQWlYelVKaetH7usu5PBHUBJ9EcdiF1Em7bYnirbW1wVH8JhD8t1HWZUQPbBbhcxD
 VqnovV7azwBluLJ4ggUf7QiaYJbFPMajEXSa/uF/Ttgo028QTFzjDRJnb8aWT/XTXurDJnRgH8a
 7lbTPo4imylCvypHKDVC5OAzuey/NU7GiK+1ZS7zga1wEhCsMPGUPeHzXDeBe8djkh9beKb7QMg
 pEraO+y0caUOGFSUb1Q==
X-Authority-Analysis: v=2.4 cv=av0nmiZV c=1 sm=1 tr=0 ts=6afaa13b cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=PFxcabDSBE7cXvBVjb4A:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: cd3UtoYT_-cMkNYmjc8-fEQ496qLj8FU
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDAyNSBTYWx0ZWRfX0KiSfz1yStaU
 N9Du4JPBgT9YpOKBNMy3aglw1NbQcKossnwWAmSzMR4HKFFyZhqR4vYoRyNsvOkIlK21toZvBCM
 7DqCGpqNDWRjbjLIHuRNd1npkif2so4=
X-Proofpoint-ORIG-GUID: cd3UtoYT_-cMkNYmjc8-fEQ496qLj8FU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0
 impostorscore=0 clxscore=1015 spamscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160025



On 10/26/2026 2:21 PM, Aishwarya R wrote:
> Peer lookup by MAC address in struct ath12k_dp_hw is currently performed by
> walking the dp_peers_list, resulting in O(n) lookup complexity. As the
> driver supports up to 1536 clients, frequent lookups on critical paths
> such as TX/RX processing, peer management, control operations and
> debug/statistics handling can incur noticeable overhead in dense
> deployment scenarios.
> 
> Replace the peer list with a generic kernel hash table for MAC address
> based peer management and lookup, providing O(1) average-case lookup
> performance. The hash table is implemented using DECLARE_HASHTABLE()
> with 2048 buckets (2^11), derived from
> order_base_2(ATH12K_MAX_DEVICES * ATH12K_MAX_CLIENTS), and uses jhash()
> over the peer MAC address as the hash key.
> 
> The hash table is used both for address-based lookups and peer
> traversal operations, eliminating the need for maintaining a separate
> peer list.
> 
> The maximum single-radio client limit is defined as
> ATH12K_MAX_CLIENTS and reused by the memory profile and hardware
> params. This keeps the peer hash sizing aligned with the per-device
> client limit and the maximum number of devices in a hardware group.
> 
> Key changes:
> - Add peer_hash table to ath12k_dp_hw and initialize it during
>   hardware allocation.
> - Add hash_node to ath12k_dp_peer for hash table membership.
> - Introduce helper APIs for hash computation, insertion, deletion and
>   lookup.
> - Convert MAC-address-based peer searches from list traversal to
>   hash-table lookup.
> - Replace peer list traversal with hash table iteration.
> 
> Peer creation inserts the peer into the hash table, while deletion
> removes it from the hash table. Peer cleanup paths are updated to
> iterate over the hash table and safely free peer objects.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
> 
> Co-developed-by: Harsh Kumar Bijlani <harsh.bijlani@oss.qualcomm.com>
> Signed-off-by: Harsh Kumar Bijlani <harsh.bijlani@oss.qualcomm.com>
> Signed-off-by: Aishwarya R <aishwarya.r@oss.qualcomm.com>


QCN6432 support recently get merged upstream, so you might want to rebase to have its
max_client_single modified as well in ath12k_wifi7_hw_params.

with that fixed:
Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>

