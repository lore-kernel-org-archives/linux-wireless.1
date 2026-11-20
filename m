Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795151560;
	b=04I5sPSy0HPKuVRjM7qaaeZbJpAXE115aUF03elMzw1l9uaV4zslkYxK5utNKm88OENO
	 haFhxNHN8DgKeda5wBs1s8Z3waVeRPz0u/eNIuqvC+5HvlpGUetXsdlV7jydxAK2zPls3
	 XVmiPlUVy5NPxeHnRsrWAEAyf2+xpohZGj9ab6qsI6a4G2TIYXEROG3BJ5utwWtuv34lB
	 olTdEUKBmatQZyrJJ/od0vfBKVxXf3yVIsvMjtXsBeSXMAGShPfo2gOpAxJtr0V7fM9ba
	 YQIbzQkU9wuSGkL2ZxVvafq/5Gl2RR+/GJMFdt0LrshIRSpKHRRRkXqbrQQMeyiw8uA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795151560;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=KudALHjSrYnBsw3pEj/DMe9yjTELoN6g5Jd1NdVDQeg=;
	b=uO/jb8iTO8BA82RHNGHY/WHm1wpVVEJwPtUDO46q1GCDobbwg9Lv3XMldOdZ3O/Uov36
	 WvlWhfJyXFmmuxPjWUDMDhUrp2MFlPiIk/YH7KWrcskbgfAsOA9+YM+OK8IVebCm3ea/G
	 ou7uC/IqQe+H6iyN9VC0Tg+Z92fzaxtxQIEOvgBbq6g3PhHHZbSsopJp//nrgi7/bCL1l
	 cIy0/pCuEiWY3ZEy7Lf8zgqLq+hfcYByHEn2q2119ivEuP+//XvP2zcXkxR0nLIFY0V2h
	 Ys1L2yJsw/PIS24PvdurWoDajMz0MuY42BOFLXzV92mpNMCzn8OXGtynz1G61tDQoKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dgJ8zSHs;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=E4UIE5+2;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A29D8606A320
	for <linux-wireless@vger.kernel.org>; Fri, 20 Nov 2026 05:12:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A29D8606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dgJ8zSHs;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=E4UIE5+2
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AK56uRY3991392
	for <linux-wireless@vger.kernel.org>; Fri, 20 Nov 2026 05:12:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KudALHjSrYnBsw3pEj/DMe9yjTELoN6g5Jd1NdVDQeg=; b=dgJ8zSHsz/T8li/l
	m2qjkuPkgDMe9vuY66T5T9mxF3NAf5aWuR3jdeAz31mYB5GMMLPge3fClAQ19BBV
	V6UvR5yNk2nhV0nqYhGoKoeeXDvrf/M+HfUIeyHKxC0Q6YS+Z3eH0z8LWBKJLrCS
	Qz5GGJAmM983qhuQ3L2cwRQhNv81KP6ffYlOD9uEOK/8VtE72PkmkBzswsKuWo8F
	9tqLHGGd1k62T1FImbZYwlUVMjbwGJA7XxrY/hszYeyDvNB6SkID/7j3uCo9ibAJ
	H3yOQaekxdvoHLpFrMi1pvutjH+uWQxai4Buu+B7OrrWKsQxe6utxdExLEzTNHss
	idO4Pg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2fsbg153-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Fri, 20 Nov 2026 05:12:38 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8b7cc3f8a4aso477890b3a.3
        for <linux-wireless@vger.kernel.org>; Thu, 19 Nov 2026 21:12:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795151558; x=1795756358; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KudALHjSrYnBsw3pEj/DMe9yjTELoN6g5Jd1NdVDQeg=;
        b=E4UIE5+2w9Rv4xfqgMxzb5WX+P5FvYIK1vzNBCKuIf8FdpAz6BS96jT7kyQFiDC1s5
         Gp5oF7DRf73Fhcqyt+fCNonloI13tHBEB5Og/7V6zVjv8hd9PUcZsJ6fH0i1LD4HxsAJ
         54AYfs4l1iuH5ixkknn0VQGpU1g4EzMsRJTcMB+RNTY3WRBKRG3p+r740A6BEIS9Z7qN
         cop/xUNwgTOZROWeisxJrrVZEaU1ZTQpGUoF6uqByGbvErwUZzxw/J6f/k5B2JTmFnE/
         asMdXlO+Gl5hSm0tSWQ0z1Zt6OMU2LZjxr/EOlAVje75CPjTkviMOYv31GjRrCO8EVpS
         Gw1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795151558; x=1795756358;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KudALHjSrYnBsw3pEj/DMe9yjTELoN6g5Jd1NdVDQeg=;
        b=n+fr0CBhfz2vWGWeGqh2aZiMXoVjj1lDRqsBDW9LHxTLjwU078Y+kqXquurr6/RDjt
         rU+FJNvKiEq9POIey6fxjLHyHyw5E4S+P1Xq/9a81+214zlfpkoYWjlt0E+MtcB2EEVb
         SVs7gYvplYNgssvkUf3QZBWRSCyRk3VnDvABJE+ciqQGJ+UP5mKE5HzHDijhjDVlqVGe
         WeE0cjr5varDdyNM5IfvO3TGi6BRxuWX8wrS9xoRN2uLlSaoE1uKGI1wZjW382vYVilt
         daQW906e86N9Rjv6hZD6dFOt5VU5O/O42GSNYqGQsl7VDWFOeXUTSrL4nmaYFjhs/WOu
         dZQw==
X-Gm-Message-State: APuU4Z8MUDn6sMYx1/Zs8N1sLa+mNzkPlLJmRcV+QcT+roaE0gvaU32W
	NXmV/PSKw6wu/7SQZeZrk62L2X780iHK10j4UjkY3GQh4/09CMOWVL/WJdSWJJxTcF1V3EUEvoA
	JpUDVnBuP0fZM14foNsrcI4Yngua+HXXMa8qIWHtwU177hcSfVfkFzpdbQxrk8xEA1/YJfQ==
X-Gm-Gg: AYBFou3S8rEjoluotynI/MeeA1D9zdbu74mKHLT3Un+o8ArsjEj2B1THeDWiY7aCSRz
	5abT2doVh85jkiGPju7vcrTa3SvBMtfQZZvZ80CiTns/Wx86euKX6MDo155J8I6s62tHLh1XD8j
	5csP6pvipGBeGQmJhHB0hdF0tr14gtY1wutZyc8sEZ2eM5Oq6uS66lggvy+b2oATixFSgHk3oc+
	JlSz3Ge7uE2RsaQc3685J+XnYJKd5v1lZm8TmCHT+BMIDK1JZwxKRO02mbaxrM20HLp0C0dVtpn
	Xly6w7ip71Nf5WtCSLfhk8oxMgNd4DlIqI/Ay/E3K4BI3apKhxsZws02+2zycMaRZjM4GPd3vvV
	dHIa452SAI2vCrOPipLcklyEQ3LMDR002E6oGorE5++Kr8eky1wYKuDEVtDUhDtkXl5yrtk/OcJ
	6msg==
X-Received: by 2002:a05:6a00:10c4:b0:886:3bd6:fe65 with SMTP id d2e1a72fcca58-8c87b9d0526mr1963978b3a.19.1795151557614;
        Thu, 19 Nov 2026 21:12:37 -0800 (PST)
X-Received: by 2002:a05:6a00:10c4:b0:886:3bd6:fe65 with SMTP id d2e1a72fcca58-8c87b9d0526mr1963958b3a.19.1795151557102;
        Thu, 19 Nov 2026 21:12:37 -0800 (PST)
Received: from [10.152.194.17] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c872e45eccsm900570b3a.31.2026.11.19.21.12.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Nov 2026 21:12:36 -0800 (PST)
Message-ID: <f82cd743-adfc-4ebb-a796-7131a0b07004@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 10:42:33 +0530
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
To: Baochen Qiang <baochen.qiang@oss.qualcomm.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Harsh Kumar Bijlani <harsh.bijlani@oss.qualcomm.com>
References: <20261026062131.1589569-1-aishwarya.r@oss.qualcomm.com>
 <2420c657-0aee-4d8e-9c84-dd8aeb510841@oss.qualcomm.com>
Content-Language: en-US
From: Aishwarya R <aishwarya.r@oss.qualcomm.com>
In-Reply-To: <2420c657-0aee-4d8e-9c84-dd8aeb510841@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDAyMCBTYWx0ZWRfX36RkBqzpJZn2
 tvkREzYAhUQ7y/CqJQwqd2p14HUWoixv5bNEiBqJ6ZOuuI57dS1Bp6NFAI3Ac37FGmnlbTX9aIG
 I58FN0cUReR7BEjQ+vJXA2kaHPxwHsZSHN7hwngMWyoMpl/enVyf2/xrR/qLdymXfTkIZ/+Q15o
 tyrl3pc17X3kFA4ZB5Rwwd5h98e7ID9ouJVSbw8GVq/v7qHJGgKEGYTWQQz+jKessR8V4SfTshj
 GBSgERA7gVlfyDoXnSDAagkXhFQZk8lGnLRhyeWZlE2E91kkA3iXuEKz/rAxef/rc0wBFNmWCC2
 wjw9nMn6AGs1v0quwSWC8IxFm24gZZi2dZS0R31B6WUjMIXd3PdRDKR7Atk2kF9Ei4CQhTl1RS6
 H7MHj9y5yl1HvlLlPgB20Ho7RKt7jt2aiujwJrEkvNZfYMPuTlT7QPxsmfCk/qFuO7bHIDSWofr
 ZJhosRleuSla3PP9G7g==
X-Proofpoint-GUID: spznQzXm5svO1_GUpMp3yWve7TKI_A93
X-Authority-Analysis: v=2.4 cv=DeiCOftW c=1 sm=1 tr=0 ts=6affd6c6 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=A1sr6ljbd0UWWdy09vsA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: spznQzXm5svO1_GUpMp3yWve7TKI_A93
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDAyMCBTYWx0ZWRfX6SNnoxEmC2s1
 FKocvtnK3KDHNWzh2wTeKLzD8nCn57dQTZYzKKLc7gT/dMvmdQL/qavJCy1Ul68tiFDGV+K+Yh4
 8gd9CWKkTpXZOqZNEkJ5ADuC3hwQAKA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_02,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 adultscore=0 impostorscore=0 malwarescore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200020



On 11/16/2026 11:52 AM, Baochen Qiang wrote:
> 
> 
> On 10/26/2026 2:21 PM, Aishwarya R wrote:
>> Peer lookup by MAC address in struct ath12k_dp_hw is currently performed by
>> walking the dp_peers_list, resulting in O(n) lookup complexity. As the
>> driver supports up to 1536 clients, frequent lookups on critical paths
>> such as TX/RX processing, peer management, control operations and
>> debug/statistics handling can incur noticeable overhead in dense
>> deployment scenarios.
>>
>> Replace the peer list with a generic kernel hash table for MAC address
>> based peer management and lookup, providing O(1) average-case lookup
>> performance. The hash table is implemented using DECLARE_HASHTABLE()
>> with 2048 buckets (2^11), derived from
>> order_base_2(ATH12K_MAX_DEVICES * ATH12K_MAX_CLIENTS), and uses jhash()
>> over the peer MAC address as the hash key.
>>
>> The hash table is used both for address-based lookups and peer
>> traversal operations, eliminating the need for maintaining a separate
>> peer list.
>>
>> The maximum single-radio client limit is defined as
>> ATH12K_MAX_CLIENTS and reused by the memory profile and hardware
>> params. This keeps the peer hash sizing aligned with the per-device
>> client limit and the maximum number of devices in a hardware group.
>>
>> Key changes:
>> - Add peer_hash table to ath12k_dp_hw and initialize it during
>>    hardware allocation.
>> - Add hash_node to ath12k_dp_peer for hash table membership.
>> - Introduce helper APIs for hash computation, insertion, deletion and
>>    lookup.
>> - Convert MAC-address-based peer searches from list traversal to
>>    hash-table lookup.
>> - Replace peer list traversal with hash table iteration.
>>
>> Peer creation inserts the peer into the hash table, while deletion
>> removes it from the hash table. Peer cleanup paths are updated to
>> iterate over the hash table and safely free peer objects.
>>
>> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
>>
>> Co-developed-by: Harsh Kumar Bijlani <harsh.bijlani@oss.qualcomm.com>
>> Signed-off-by: Harsh Kumar Bijlani <harsh.bijlani@oss.qualcomm.com>
>> Signed-off-by: Aishwarya R <aishwarya.r@oss.qualcomm.com>
> 
> 
> QCN6432 support recently get merged upstream, so you might want to rebase to have its
> max_client_single modified as well in ath12k_wifi7_hw_params.

QCN6432 uses 256 for max_client_single. The newly introduced 
ATH12K_MAX_CLIENTS define is only for hardware supporting 512 clients, 
so no change is needed for QCN6432.

> 
> with that fixed:
> Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
> 

