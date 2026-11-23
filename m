Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795444460;
	b=4CKEo4TWF5jybEY2m63tFxeH6ljawPMX/u5DpuESOKNV4QTSx4DrPYWI9rk3FDL13SQb
	 oJG82wxmY8wMRURAnhVIULf39Cf3Szv2dJNhVE1G6iAaAkUAZX8wPO8rpRVYoHp6DWfKZ
	 XUd9LdttbA7zIvVYiUA5A2gGSxT/eAENvkRCQLMedukOlMiOVYjFHHox86Uc1Q40YEDF0
	 99QT+uitzFlr4vhql02lLZSwTkV4sgFdh+I8+8Ukl5UMhPlGqxBh7DDmwZwHeQjGC4Cns
	 GMVYd7GrGxGDP8vXoFQYWBG7g9/EJtGEPvZ4o6CP/NflrXt7E/VmleK4VNTBFv2dcBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795444460;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:From:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Smi7DyyjRxVYoicH7J6jG7b7447tQ0E7x3DcOOVFtuk=;
	b=YGijDzrzLSa0lCrt3hyvSMG4kw7TSl2GfR8mIhMP917nwd6cPE3BdSatkeaZiZfvdMAp
	 QYNQJaC6C6zw7H0msO6yntfVb4RnoKNvCNejwKFWjo8IeWbg2GEKpvazwqPPC6k4+0Z5l
	 VHq4J39qendA1wx5CTSMLc6q/68ma6WoZxVqD0FLJH09kApqEZiSRckacm5qnLfyLkfoE
	 DoI1Szlsz4IN26kbHpQWYGDXIOJ8jemuYhh7KMDeBfyitau2fhmWb2YwW5Wk7+gFwkkwF
	 S9mbSBl+6lAQ9sykFeOkoB2xGxU8xYxrSfGMWN0WsE7a3qZdmZ9XP6DoksBTCU9Og+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=A2RfhsbF;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MUOWuwu5;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26F67606A31A
	for <linux-wireless@vger.kernel.org>; Mon, 23 Nov 2026 14:34:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 26F67606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=A2RfhsbF;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MUOWuwu5
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANDKt4q1974161
	for <linux-wireless@vger.kernel.org>; Mon, 23 Nov 2026 14:34:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Smi7DyyjRxVYoicH7J6jG7b7447tQ0E7x3DcOOVFtuk=; b=A2RfhsbFTZ2+HTle
	sLG+m/K8OrvRA9VXTgH77D9x25c9JWolKsMsguUulP4g5zXbRscSws2nJ6cXD9Oe
	cUI4Us34XskMW9E9bj63kvdcWOV5exFG+stnQX6SzzJGsXQ9HxCQvblyLqjmpElE
	l3RKlV9Bjaoz3R9UKzYrMuwUe2UesbFNRLFdqwsj7pHZHSchq0eejKwvsAuDsnEu
	mFvpPuZuaYziaXVGG16WfU0M8tV2SJbOkVUHMPkm2fFVOi4YTuKeSuC6L5aToTNU
	Mc+tXKXOeY6zxsc7ApVRYjxNYHw81RlrKaSAk9w9ukw892/3eHB4S8A03IOIb0cd
	7U9mqw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4m7urs98-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Mon, 23 Nov 2026 14:34:18 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-375bac6bd21so3822743eec.0
        for <linux-wireless@vger.kernel.org>; Mon, 23 Nov 2026 06:34:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795444458; x=1796049258; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Smi7DyyjRxVYoicH7J6jG7b7447tQ0E7x3DcOOVFtuk=;
        b=MUOWuwu505BGFE6PMn17uRD+3J1Xhnu9Nv1fk4JqNDI9xiZdehTkjMO1Qu3zmUFtct
         PsG7KqNXE01fN5QInxDXFcCGiwAK1+m4mZlWbKFD2unkY3PSpKYYYydW0NYSrZeU8ANj
         hxqt0yvcsujYP+h884RSJ8omXwO/rRPDBXYxmOvwYcrP2nI2adkEgn6XjVksoVz96JN/
         wUloBaeg5W5SuyiKHcHzrRiGfHp+hB8/AxEH4jYJ8oQ5BcnYF2dsMN5WCu28j6tpnm78
         0XC1zsmK0Dz6T7wiLrsODPe6pDguODs6oIninygJYfHi3v7ovWchHKAq492yS71CqeGQ
         vy1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795444458; x=1796049258;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Smi7DyyjRxVYoicH7J6jG7b7447tQ0E7x3DcOOVFtuk=;
        b=aCVcf6hvl9er950sANz3Uj7yZFwKe8fjT53Qa9rem+UBC8mEO5a+0tO3Fnro37g/bL
         rNPAOdATlIztt6a9S8awY221JXlGCDMIvOGNJVk1J761TJBdikoJUItIt0oZqsyUSUIT
         hF0gwFjnhQFMR7kYRPkMe3W9cLNolwN1L6/csFnHJHDGVzPIQwhJy3++m6oervZSEZYY
         qxnfPFPeBGOz5nla+Q9m/43FOE8bYjuXOzxoHGh7Xx6oGu6X5PolZyivDqKQU+8GQeYk
         dyU8chKIVVQE2/Ddx/kcD06BcqGjkFppB3I/orLvikn3ZfFOsp8fVa7tt0p1diNT3m5R
         yiSA==
X-Gm-Message-State: APuU4Z/xJIM6NurcQUNu963wEfPsBEuJSMNZYeHpyJJdiZp5Z0zoXqLw
	/9aq+cV2myqT0HrNUGaS1a0/DmrdcXWvk/V9dSIi59NYNSYayR/Gw2TpXr5KRfcaqelp59oAsVb
	q5FW0VYWik+JVRXiCN5x3RMyGrDvG3lXtGqXdY69Z2Aosesbcvxc2B2xx6cMq8CsWDpjfMtGbJI
	M42w==
X-Gm-Gg: AZFdTZf4yNwZT+X+4aVsrbUIgBk2jJs1ka1Vjxs3wdqB5NYatWmNWfKxwH+yBPVZwRS
	Q+Ph8tVKeEavs6utD64/9eXjol6vHG8LAPZj2T7riNbrzvNgC1y2KJZDYulehkmwTzBxPVND168
	k24q7Onfmuig/R37TrV55GDPpZRUD8wIW75RZveKsgk5WcKzHPw7j5wHj0Vo+X4o/dk2/VuweCv
	77XRONXwK+q2hLZ91utzBi93+0kIhf075y4o3R9Qt8O1Egb/hEqgOzoPKrvgIf/uWhSM2zQE2BY
	R7T8p2x78wBfgOc1lo0aJ3WUQ7A2Rsjmx3deGMnbj3pLkuyAOJ4zVuWWHUq2JS2I4bQS03JeR6G
	PsLDFlUlzgovBF5Csq/7w6ODUCdb0nJq533sb6FzYnFA2BQkp49VxW+z6mGfMeLG50g+T0tq4M5
	m0+VJ8x1CvGQKCubnu
X-Received: by 2002:a05:7301:2b5:b0:386:b8a7:a195 with SMTP id 5a478bee46e88-386b8a7a885mr1173715eec.2.1795444457631;
        Mon, 23 Nov 2026 06:34:17 -0800 (PST)
X-Received: by 2002:a05:7301:2b5:b0:386:b8a7:a195 with SMTP id 5a478bee46e88-386b8a7a885mr1173687eec.2.1795444456713;
        Mon, 23 Nov 2026 06:34:16 -0800 (PST)
Received: from [192.168.11.103] ([124.123.81.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385677c0c1dsm40049875eec.21.2026.11.23.06.34.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 06:34:16 -0800 (PST)
Message-ID: <99ed1f21-2c87-4673-8d4a-45f20899b3ef@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 20:04:12 +0530
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
Subject: Re: [PATCH ath-next v2] wifi: ath12k: add hash table for peer lookup
 in struct ath12k_dp_hw
To: Aishwarya R <aishwarya.r@oss.qualcomm.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Harsh Kumar Bijlani <harsh.bijlani@oss.qualcomm.com>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
References: <20261120070900.541279-1-aishwarya.r@oss.qualcomm.com>
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261120070900.541279-1-aishwarya.r@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Qs3U9G80r-xXJa050PACg0uManNSb2DF
X-Authority-Analysis: v=2.4 cv=KurYSmWN c=1 sm=1 tr=0 ts=6b044eea cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=WcLwt0pvHDAIUQ3iVSLIEw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=xdo4dnPfHygUjUsX-2sA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: Qs3U9G80r-xXJa050PACg0uManNSb2DF
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA1NyBTYWx0ZWRfX72gSMln3Nf8J
 N0VHwSKfn2ZnYK+AroA4rE/i67PHsYwtF+BwNmBb8ghFez5eWPOnBmlogUrATBcKZBQ70u+WxNp
 kN9kIDXvRqXeKzp1n8FWiGGYJCDNXfg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA1NyBTYWx0ZWRfX1DJ7V9HjdB1B
 YwLRrH7guWw8iFODUeY4OK6fYBdRnDm6NEE/TJ0iDTmyNaIiD7Q2NUDyVzyCX5Qbu3oVScpGa9h
 j0vELx72Me0+CWFo2m7DYUyI6KCD/vrGd1SYWRrf9WkMnwJO+lGToP+bFUOT91hRMCoHK7EP7HI
 kucTFU/GdWbfz/I2+0dwkvzCWGYKWT4M8It9CBXF9nE3hJ8TwDCjNB5KyJLEef4Tysy5hTNAl46
 6I6H3+QkPza7geK/ssIYYdXiLQB12jAYvDLaXRAiolUf/RcaP64pCJ8ODnjmDnaMBk+IJt8tAQv
 BM7Clwu+hxNi/BJ0O5L8cSFZsRk/0oADFZTM+pxv/m+G4IoAHG1/qXh/Wu9fWt4uQQMARcdvPix
 Tq9OMB81cyWS2ZURrzgPctpgJrSRNhzn5PnK9xNcLZmQnVRj6bOKmr46/ThnTZUoGmCthskz9DE
 577WNa3KiiePmZ+5EQw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 phishscore=0 spamscore=0
 malwarescore=0 adultscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230057

On 11/20/2026 12:39 PM, Aishwarya R wrote:
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
>    hardware allocation.
> - Add hash_node to ath12k_dp_peer for hash table membership.
> - Introduce helper APIs for hash computation, insertion, deletion and
>    lookup.
> - Convert MAC-address-based peer searches from list traversal to
>    hash-table lookup.
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
> Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
> ---
> Changes in v2:
> - Rebased the changes
> ---
>   drivers/net/wireless/ath/ath12k/cmn_defs.h |  2 +
>   drivers/net/wireless/ath/ath12k/core.c     |  2 +-
>   drivers/net/wireless/ath/ath12k/dp_cmn.h   | 14 ++++++-
>   drivers/net/wireless/ath/ath12k/dp_peer.c  | 47 ++++++++++++++++++----
>   drivers/net/wireless/ath/ath12k/dp_peer.h  |  7 +++-
>   drivers/net/wireless/ath/ath12k/mac.c      | 20 ++++-----
>   drivers/net/wireless/ath/ath12k/wifi7/hw.c | 10 ++---
>   7 files changed, 76 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/cmn_defs.h b/drivers/net/wireless/ath/ath12k/cmn_defs.h
> index 20208ffea1c9..15c5e8d11afc 100644
> --- a/drivers/net/wireless/ath/ath12k/cmn_defs.h
> +++ b/drivers/net/wireless/ath/ath12k/cmn_defs.h
> @@ -10,6 +10,8 @@
>   
>   #define MAX_RADIOS 2
>   #define ATH12K_MAX_DEVICES 3
> +#define ATH12K_MAX_CLIENTS 512
> +
>   #define ATH12K_GROUP_MAX_RADIO (ATH12K_MAX_DEVICES * MAX_RADIOS)
>   
>   #define ATH12K_SCAN_MAX_LINKS	ATH12K_GROUP_MAX_RADIO
> diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c
> index 719200759ca0..6e0bb1fecc09 100644
> --- a/drivers/net/wireless/ath/ath12k/core.c
> +++ b/drivers/net/wireless/ath/ath12k/core.c
> @@ -44,7 +44,7 @@ static const struct
>   ath12k_mem_profile_based_param ath12k_mem_profile_based_param[] = {
>   [ATH12K_QMI_MEMORY_MODE_DEFAULT] = {
>   		.num_vdevs = 17,
> -		.max_client_single = 512,
> +		.max_client_single = ATH12K_MAX_CLIENTS,
>   		.max_client_dbs = 128,
>   		.max_client_dbs_sbs = 128,
>   		.dp_params = {
> diff --git a/drivers/net/wireless/ath/ath12k/dp_cmn.h b/drivers/net/wireless/ath/ath12k/dp_cmn.h
> index 88abe90767eb..ff011fafc175 100644
> --- a/drivers/net/wireless/ath/ath12k/dp_cmn.h
> +++ b/drivers/net/wireless/ath/ath12k/dp_cmn.h
> @@ -6,6 +6,7 @@
>   #ifndef ATH12K_DP_CMN_H
>   #define ATH12K_DP_CMN_H
>   
> +#include <linux/hashtable.h>
>   #include "cmn_defs.h"
>   
>   struct ath12k_hw_group;
> @@ -18,12 +19,21 @@ struct ath12k_dp_link_peer;
>    */
>   #define MAX_DP_PEER_LIST_SIZE  16384
>   
> +/*
> + * The hash table supports ATH12K_MAX_DEVICES * ATH12K_MAX_CLIENTS clients;
> + * order_base_2() gives 2048 hash buckets.
> + */
> +#define ATH12K_DP_PEER_HASH_BITS \
> +	order_base_2(ATH12K_MAX_DEVICES * ATH12K_MAX_CLIENTS)
> +
>   struct ath12k_dp_hw {
>   	struct ath12k_dp_peer __rcu *dp_peers[MAX_DP_PEER_LIST_SIZE];
>   
> -	/* Lock for protection of dp_peer_list and peers */
> +	/* Lock for protection of dp_peers[] and peer_hash */
>   	spinlock_t peer_lock;
> -	struct list_head dp_peers_list;
> +
> +	/* Generic hash table for fast MAC address lookup */
> +	DECLARE_HASHTABLE(peer_hash, ATH12K_DP_PEER_HASH_BITS);
>   };
>   
>   struct ath12k_dp_hw_group {
> diff --git a/drivers/net/wireless/ath/ath12k/dp_peer.c b/drivers/net/wireless/ath/ath12k/dp_peer.c
> index 4e753e6abe3a..5dc7f08e6292 100644
> --- a/drivers/net/wireless/ath/ath12k/dp_peer.c
> +++ b/drivers/net/wireless/ath/ath12k/dp_peer.c
> @@ -4,6 +4,7 @@
>    * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>    */
>   
> +#include <linux/jhash.h>
>   #include "core.h"
>   #include "dp_peer.h"
>   #include "debug.h"
> @@ -371,30 +372,58 @@ void ath12k_dp_link_peer_rhash_delete(struct ath12k_dp *dp,
>   			    peer->addr, peer->peer_id, ret);
>   }
>   
> +static u32 ath12k_dp_peer_addr_hash(const u8 *addr)
> +{
> +	return jhash(addr, ETH_ALEN, 0);
> +}
> +
>   struct ath12k_dp_peer *ath12k_dp_peer_find_by_addr(struct ath12k_dp_hw *dp_hw, u8 *addr)
>   {
> -	struct ath12k_dp_peer *peer;
> +	struct ath12k_dp_peer *dp_peer;
> +	u32 hash;
>   
>   	lockdep_assert_held(&dp_hw->peer_lock);
>   
> -	list_for_each_entry(peer, &dp_hw->dp_peers_list, list) {
> -		if (ether_addr_equal(peer->addr, addr))
> -			return peer;
> +	hash = ath12k_dp_peer_addr_hash(addr);
> +	hash_for_each_possible(dp_hw->peer_hash, dp_peer, hash_node, hash) {
> +		if (ether_addr_equal(dp_peer->addr, addr))
> +			return dp_peer;
>   	}
>   
>   	return NULL;
>   }
>   EXPORT_SYMBOL(ath12k_dp_peer_find_by_addr);
>   
> +static void ath12k_dp_peer_hash_table_add(struct ath12k_dp_hw *dp_hw,
> +					  struct ath12k_dp_peer *dp_peer)
> +{
> +	u32 hash;
> +
> +	lockdep_assert_held(&dp_hw->peer_lock);
> +
> +	hash = ath12k_dp_peer_addr_hash(dp_peer->addr);
> +	hash_add(dp_hw->peer_hash, &dp_peer->hash_node, hash);
> +}
> +
> +void ath12k_dp_peer_hash_table_delete(struct ath12k_dp_hw *dp_hw,
> +				      struct ath12k_dp_peer *dp_peer)
> +{
> +	lockdep_assert_held(&dp_hw->peer_lock);
> +
> +	hash_del(&dp_peer->hash_node);
> +}
> +
>   struct ath12k_dp_peer *ath12k_dp_peer_find_by_addr_and_sta(struct ath12k_dp_hw *dp_hw,
>   							   u8 *addr,
>   							   struct ieee80211_sta *sta)
>   {
>   	struct ath12k_dp_peer *dp_peer;
> +	u32 hash;
>   
>   	lockdep_assert_held(&dp_hw->peer_lock);
>   
> -	list_for_each_entry(dp_peer, &dp_hw->dp_peers_list, list) {
> +	hash = ath12k_dp_peer_addr_hash(addr);
> +	hash_for_each_possible(dp_hw->peer_hash, dp_peer, hash_node, hash) {
>   		if (ether_addr_equal(dp_peer->addr, addr) && (dp_peer->sta == sta))
>   			return dp_peer;
>   	}
> @@ -408,10 +437,12 @@ static struct ath12k_dp_peer *ath12k_dp_peer_create_find(struct ath12k_dp_hw *dp
>   							 bool mlo_peer)
>   {
>   	struct ath12k_dp_peer *dp_peer;
> +	u32 hash;
>   
>   	lockdep_assert_held(&dp_hw->peer_lock);
>   
> -	list_for_each_entry(dp_peer, &dp_hw->dp_peers_list, list) {
> +	hash = ath12k_dp_peer_addr_hash(addr);
> +	hash_for_each_possible(dp_hw->peer_hash, dp_peer, hash_node, hash) {
>   		if (ether_addr_equal(dp_peer->addr, addr)) {
>   			if (!sta || mlo_peer || dp_peer->is_mlo ||
>   			    dp_peer->sta == sta)
> @@ -517,7 +548,7 @@ int ath12k_dp_peer_create(struct ath12k_dp_hw *dp_hw, u8 *addr,
>   
>   	spin_lock_bh(&dp_hw->peer_lock);
>   
> -	list_add(&dp_peer->list, &dp_hw->dp_peers_list);
> +	ath12k_dp_peer_hash_table_add(dp_hw, dp_peer);
>   
>   	/*
>   	 * For an MLO client whose ML peer ID is allocated by the host, the
> @@ -555,7 +586,7 @@ void ath12k_dp_peer_delete(struct ath12k_dp_hw *dp_hw, u8 *addr,
>   	    dp_peer->peer_id != ATH12K_MLO_PEER_ID_PENDING)
>   		rcu_assign_pointer(dp_hw->dp_peers[dp_peer->peer_id], NULL);
>   
> -	list_del(&dp_peer->list);
> +	ath12k_dp_peer_hash_table_delete(dp_hw, dp_peer);
>   
>   	spin_unlock_bh(&dp_hw->peer_lock);
>   
> diff --git a/drivers/net/wireless/ath/ath12k/dp_peer.h b/drivers/net/wireless/ath/ath12k/dp_peer.h
> index 2ac4c6c6d535..0a2b9d1814a5 100644
> --- a/drivers/net/wireless/ath/ath12k/dp_peer.h
> +++ b/drivers/net/wireless/ath/ath12k/dp_peer.h
> @@ -127,7 +127,6 @@ void ath12k_dp_link_peer_extended_event(struct ath12k_base *ab, u8 vdev_id,
>   					u8 logical_link_id, u8 valid);
>   
>   struct ath12k_dp_peer {
> -	struct list_head list;
>   	bool is_mlo;
>   	bool dp_setup_done;
>   
> @@ -164,6 +163,9 @@ struct ath12k_dp_peer {
>   	struct ath12k_dp_rx_tid rx_tid[IEEE80211_NUM_TIDS + 1];
>   
>   	bool use_4addr;
> +
> +	/* Hash table node for MAC address lookup */
> +	struct hlist_node hash_node;
>   };
>   
>   struct ath12k_dp_link_peer *
> @@ -212,4 +214,7 @@ ath12k_dp_link_peer_get_sta(const struct ath12k_dp_link_peer *link_peer)
>   	return link_peer && link_peer->dp_peer ?
>   		link_peer->dp_peer->sta : NULL;
>   }
> +
> +void ath12k_dp_peer_hash_table_delete(struct ath12k_dp_hw *dp_hw,
> +				      struct ath12k_dp_peer *dp_peer);
>   #endif
> diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
> index a247dcf387de..51ee44e72abf 100644
> --- a/drivers/net/wireless/ath/ath12k/mac.c
> +++ b/drivers/net/wireless/ath/ath12k/mac.c
> @@ -1277,16 +1277,20 @@ void ath12k_mac_peer_cleanup_all(struct ath12k *ar)
>   
>   void ath12k_mac_dp_peer_cleanup(struct ath12k_hw *ah)
>   {
> -	struct list_head peers;
> -	struct ath12k_dp_peer *dp_peer, *tmp;
>   	struct ath12k_dp_hw *dp_hw = &ah->dp_hw;
> +	struct ath12k_dp_peer *dp_peer;
> +	struct hlist_head free_list;
> +	struct hlist_node *tmp;
> +	int bkt;
>   
>   	lockdep_assert_wiphy(ah->hw->wiphy);
>   
> -	INIT_LIST_HEAD(&peers);
> +	INIT_HLIST_HEAD(&free_list);
>   
>   	spin_lock_bh(&dp_hw->peer_lock);
> -	list_for_each_entry_safe(dp_peer, tmp, &dp_hw->dp_peers_list, list) {
> +	hash_for_each_safe(dp_hw->peer_hash, bkt, tmp, dp_peer, hash_node) {
> +		ath12k_dp_peer_hash_table_delete(dp_hw, dp_peer);
> +
>   		if (dp_peer->is_mlo) {
>   			if (dp_peer->peer_id != ATH12K_MLO_PEER_ID_PENDING)
>   				rcu_assign_pointer(dp_hw->dp_peers[dp_peer->peer_id],
> @@ -1294,17 +1298,15 @@ void ath12k_mac_dp_peer_cleanup(struct ath12k_hw *ah)
>   			ath12k_peer_ml_free(ah, ath12k_sta_to_ahsta(dp_peer->sta));
>   		}
>   
> -		list_move(&dp_peer->list, &peers);
> +		hlist_add_head(&dp_peer->hash_node, &free_list);
>   	}
>   
>   	spin_unlock_bh(&dp_hw->peer_lock);
>   
>   	synchronize_rcu();
>   
> -	list_for_each_entry_safe(dp_peer, tmp, &peers, list) {
> -		list_del(&dp_peer->list);
> +	hlist_for_each_entry_safe(dp_peer, tmp, &free_list, hash_node)
>   		kfree(dp_peer);
> -	}
>   }
>   
>   static int ath12k_mac_vdev_setup_sync(struct ath12k *ar)
> @@ -15530,7 +15532,7 @@ static struct ath12k_hw *ath12k_mac_hw_allocate(struct ath12k_hw_group *ag,
>   
>   	spin_lock_init(&ah->survey_lock);
>   	spin_lock_init(&ah->dp_hw.peer_lock);
> -	INIT_LIST_HEAD(&ah->dp_hw.dp_peers_list);
> +	hash_init(ah->dp_hw.peer_hash);
>   
>   	for (i = 0; i < num_pdev_map; i++) {
>   		ab = pdev_map[i].ab;
> diff --git a/drivers/net/wireless/ath/ath12k/wifi7/hw.c b/drivers/net/wireless/ath/ath12k/wifi7/hw.c
> index 48a2f6da16ef..9f2b1dddfdb4 100644
> --- a/drivers/net/wireless/ath/ath12k/wifi7/hw.c
> +++ b/drivers/net/wireless/ath/ath12k/wifi7/hw.c
> @@ -488,7 +488,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
>   
>   		.dp_primary_link_only = true,
>   		.client = {
> -			.max_client_single = 512,
> +			.max_client_single = ATH12K_MAX_CLIENTS,
>   			.max_client_dbs = 128,
>   			.max_client_dbs_sbs = 128,
>   		},
> @@ -587,7 +587,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
>   
>   		.dp_primary_link_only = false,
>   		.client = {
> -			.max_client_single = 512,
> +			.max_client_single = ATH12K_MAX_CLIENTS,
>   			.max_client_dbs = 128,
>   			.max_client_dbs_sbs = 128,
>   		},
> @@ -682,7 +682,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
>   
>   		.dp_primary_link_only = true,
>   		.client = {
> -			.max_client_single = 512,
> +			.max_client_single = ATH12K_MAX_CLIENTS,
>   			.max_client_dbs = 128,
>   			.max_client_dbs_sbs = 128,
>   		},
> @@ -871,7 +871,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
>   
>   		.dp_primary_link_only = false,
>   		.client = {
> -			.max_client_single = 512,
> +			.max_client_single = ATH12K_MAX_CLIENTS,
>   			.max_client_dbs = 128,
>   			.max_client_dbs_sbs = 128,
>   		},
> @@ -963,7 +963,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
>   
>   		.dp_primary_link_only = true,
>   		.client = {
> -			.max_client_single = 512,
> +			.max_client_single = ATH12K_MAX_CLIENTS,
>   			.max_client_dbs = 128,
>   			.max_client_dbs_sbs = 128,
>   		},
> 
> base-commit: 03b7c601b6e314115015a57061f5b377afe13190


Reviewed-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
