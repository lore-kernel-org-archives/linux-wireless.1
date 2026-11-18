Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794974449;
	b=ybe2o8Sqd4hQCQws2r4swRX9Trcpid01/dvrRvqDB1dqgZM+eXaF3taP5bGsLeAslMP3
	 9aeMZdFwBWg6SC4vwhR+LS6bhCfIjrZ7p08fB3TGlW7HuGhj3A0fffmoomhe7w+88d0ei
	 wvRWmIC385z93UYYLbXFE+uPhmeoKtAhF2wvydoko0VG3LiRQknOxICMdqFbqqyhY5dTB
	 EdMP0iScfytmbIGSH7CPtEKwJcq8KYymGedR7mbV51K39y3x3LUaQWR6/V5vBAIS9uxOb
	 e4U69/cboPxjld7C4k6NIGmjowOF1LcjY0TsMtFCE4vi+cG37/qJ2kC550IfpfHK3ig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794974449;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=P/aCbd8gNdr3LHgaWm5l/br1ZRzYyDdSxOOzhGf8hXQ=;
	b=tBkTu99yhmwn2TxacC8VvGJQIFj9hrlC7LJ+7aBJ2Zvin9uA1FBLwC5FHzNlZ7fnw8FR
	 C71KVPt6xuuBddWPGXAZpQhHk/utKWc5d1oyH2R+5oSlMD2WusPSqoGcAt7iTxaXhpRdu
	 XbZYLp9elyxJqb0d88+1X+/YkKw85OCSJlgrMpVgxdEToV/FmMzoVRK6JUkQuIvBRTJfP
	 Mw+5QAkmjCShYyHOGi+5hHutPejCasWWdwSWCJSC+e0Li0JvUGh8qbyoIRxHO/IBrFk8R
	 crvDvKvZoWZtDGsEFy5ssJsHBsKOUFxbEHhEaASEd03wsmbpLu0hGmUE0bg24l3VeXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pZYh5HVp;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GIFMNH7L;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F157D606A31C
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 04:00:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F157D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pZYh5HVp;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GIFMNH7L
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2Uvnp472517
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 04:00:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	P/aCbd8gNdr3LHgaWm5l/br1ZRzYyDdSxOOzhGf8hXQ=; b=pZYh5HVpJNgC3h6C
	qn4NdNhzKg/92PUSNO/CDsE3iaQan1+DJFCspw/agIQlY1aX6kZ/tYvP+NjCTwXb
	mxG/0pCguLr4Lu88laXoVEgD/1rafyrvc4J/rF7zmpc9Y9zYdjIikMrSBWolNsvd
	whIDa/qJuf0Hyz9sK2n+mEsq2JYZ7qm9Vt0hxie3QFfAv7BK3WHxkHLO+2MIm5OU
	JUIQ3N1p31tyBSm3b03W7H9oFJBPT0Uk0+X23VFkWxRqgXF7qtOPG00uM1NnbyS8
	cv15vEEz3qPK4sOt7FMVsAO6Oeb5Xt4xqSM5Rg/Cjs07Fp1knQEbUt2gE/G2SU9O
	YJgEmQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv892d2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 04:00:47 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3b175a69ab8so531701a91.1
        for <linux-wireless@vger.kernel.org>; Tue, 17 Nov 2026 20:00:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794974446; x=1795579246; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P/aCbd8gNdr3LHgaWm5l/br1ZRzYyDdSxOOzhGf8hXQ=;
        b=GIFMNH7LFln7nU/0PiJ0BXgYCOOitQG6OmCQCLLD+0QPcKc5Z4ZggeAppFxe1bCqlv
         JzvbHnP5KVV8RH+OceU3k0fH2DfCWBCPDGTv01t/MTtDJ38sW5YT+/D2tXrOHS0Y0aZa
         tIG3QDdR4huNPn9zPKIc7TB/rmS55oXzeqtQxqq1VO31YzvPwuIVoo21jE2U/MIjQqGX
         KY/tt6hzy+rMbiJReooHFmp/aHgCC3gOiZ0rHW8uOgrXGmor1EA2H+kvtjK6/5x4Zc/b
         bbc93n9drHjmSgy6cWE8I8ZXM5p9u5okoXxz+mleXrEDShDeMVTuuSpJlIUzitTpmlN9
         HrNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794974446; x=1795579246;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P/aCbd8gNdr3LHgaWm5l/br1ZRzYyDdSxOOzhGf8hXQ=;
        b=u/K1eb7hMV1DovTki8UE7PG5L5DgzdZAZ2qru6cW0TXEBzKw2LOxodL6hoDdlhJCp0
         PHXHH5LiusVRMCeDhKwcUU+o35z9Zf3pSlIWh/WWHaXvZHAe3vIhfA6ZZE/XM2Q9qPKP
         P5OZJ4+YsvMl4Rzmn7Xl+gzrHVmQwUIzFIJlJ2eM5kISHCIzhKNMrf8UTM7x3AzucwEA
         x0nbOe7Oej6p9h63AqDaViskwU/zvyODuGrcki0xi9+IodbUiNekyaa1O08m02dGOcHS
         aJdiZYhTLFnos5/Ypkvxz2lD6UvjKJgpXogzlcvWtEun+of7XeNWY2cG/9Rb1m3Vq+4R
         3ePA==
X-Gm-Message-State: APuU4Z+9yG+Tmg4LXU/4gyc+3KkUTC+h4qTlsTJgx4nZlyTtA46HmGbB
	AgyzEg5Xgs2siYMmeorE/8ZYGWl6iIoS75pKI1yPIzVXFoWDlYMj4QPmaY98C2htl0OwJzg8fZK
	RxTtrz5gt5WFvjgnnVOGr+W0JgOISTbMyWY6OUPD7xZvsuB8FtVO/7969tg6iEPPJU3ruLyCsaY
	CsNA==
X-Gm-Gg: AZFdTZeMXZiZL3yS05NL31G6M1mrzVIFZ0gVLgWKXYE5G8mqHl+kGjmMk/noAMXDy90
	zZBG5ObtPb2ltwwRQNkVne2ZPHg7mI+0HJY540KVneeAB1oU9krVBeYRxRxMkEeO2V9Wt4gocYw
	GPIdMeRn6znwVq3W+SHbYhDc35O9tVndF8po78pg3eO+NoPcA9nXDczWG7ZlicK+aPcmbcaIKLR
	QSlKrKKaLXm/BrnCyi+Kwp7ZA0//YcFBvL3Q/wwqWQqAcH/Ev+qtEI+jEEPn34JuAlVEOjR59eP
	XnDt/N04jNz7HIBLp0LQLXTPqFUjDC52GePcK1YA3HvSPC+0+eIq4hQEJ5AOkbRLm+rzVN/yMps
	xVuw+05FbiPZuKLvUIXHCbK++po62MM8GWMqfmmQlUn0bSDUuvL1LEAIwdNQF1i8gKP3Pniaqrv
	NfYA==
X-Received: by 2002:a17:90b:1802:b0:3b1:922a:7b22 with SMTP id 98e67ed59e1d1-3b3d07c66b8mr1531106a91.60.1794974446124;
        Tue, 17 Nov 2026 20:00:46 -0800 (PST)
X-Received: by 2002:a17:90b:1802:b0:3b1:922a:7b22 with SMTP id 98e67ed59e1d1-3b3d07c66b8mr1531068a91.60.1794974445641;
        Tue, 17 Nov 2026 20:00:45 -0800 (PST)
Received: from [10.152.194.17] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3abb786f7sm6835082a91.1.2026.11.17.20.00.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 20:00:45 -0800 (PST)
Message-ID: <0a62305e-4bff-4273-9153-9cdc0084151a@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 09:30:42 +0530
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
X-Proofpoint-ORIG-GUID: cMwhgSub1jJW0NP6pMnB_ILqXzpGO8ah
X-Authority-Analysis: v=2.4 cv=N9u8hG9B c=1 sm=1 tr=0 ts=6afd22ef cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=A1sr6ljbd0UWWdy09vsA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAxNSBTYWx0ZWRfX6uJbTNkRufs0
 K75fo74GiKIXKvJVAkeyad39KPALtOszYn/UZIF7COChqrmNAdK+KJAbi4b0O32GGX7oLeyULsk
 dXo/UM6I51+7UuY2DG7oFLgPd/CJ5IrBP9bqJuZHbllnN0QypDQ1siVN5ZLKpMfb34uvlejuJTD
 kug4V9c+k3WIl3xhZeuY6DRR10zEHnpdIzEGhDuJpCfrX0WDZXkAPYZvqxh2iCG1SY8L91A+yMX
 w2BVYW1v/R+wTJpJAb+zdjeZmuncEkuyX2euqCExNe/FdflDv+fvpeH52oYLekaZjxgRFDc8esM
 AebzcH4MiWafZsperxwR4BaAZxH7lC+50zuYwc6jGutEZbpXL7u8EZNBwiifVsualkB+/ZBNvnz
 GSNZ0Pa7CEWUGb35u/dvRek8AEHWEw36u6eqgsKKktoFh65j6mZ28339DXwKV7TV3SVenJ7zUD/
 pW7Czpj2/hB+mLO7iXQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAxNSBTYWx0ZWRfX0isOhzAhm8bg
 l40KLJHEHSo0fwci8wk5fUOhe0ZfjKbQt/Jf2MqdtcVHHqeYU680ysYGdSGG5He2a8/XUhiThC+
 hFdT0ES3D2BgfPHD8laNzF5mALdj9Xo=
X-Proofpoint-GUID: cMwhgSub1jJW0NP6pMnB_ILqXzpGO8ah
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180015



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
>

Thanks for the review. I will rebase the changes and update 
max_client_single for QCN6432 as well.

> with that fixed:
> Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
> 

