Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794296213;
	b=vOVxbMU63Sudd62S5zTRRO9LdLH1YptAylv+vggtn9sUcFwtOJ8k4/XbR6T5C/GRWhr9
	 w+5n5jTQc3fbQc2Eza7pQugozlqjT4HpRDX7O5Apws3rD/VdltzqMWArJWlaGk39mUPHg
	 TBJ6whZPwPJO1V6vlTSQB1VRVWKMW9LUBoBlQo9kIPkrnJCqYkHm1BbLK07NRzu/cKcL0
	 L6k4U/0LzzhMe8isXxrb8ga9vD8ys+3GQFAZiyCMapQ2H3eagiBvrL0xLH+tEh4MXpiGU
	 5vMVxCIv0O9/vGz/kTiU1gBCFy0qHwZDlUyAYyJ6cflLzab1+prqFjmxOSfkNJHocIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794296213;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:From:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=CUqN75cKWzgabTOF6ENl/PYaMqYf/ZoDoIbx/U7DSRs=;
	b=TexHU/PGFR0k6f99ezgD0+vBhbmEHfidiaW5035noDfpAeIwEF8GbxWxcYwSmvfm4Nha
	 MNFmgJetY0heXYkyE4ndf7FTb4JgqS4t3yPPYjpnCnXhqCWjmeEwovKZPmSCmZbbXWY9M
	 8s1oOAj53xnlFY9HePHVWAE/f6VKvmfk2nr6CPA1F6hLUXkchfppezPH1WUc502C2m5Om
	 8aT8JskQhBLUIV1P74qrAYtdwTLsPMnXhVclWpoiZZF8N0bY23kyw1F7F9tRs87t/X5e/
	 /OoQUmBf1kEuuoPhQ8uPBDVHx8OpnK5FzJEn5Rlg3yg+o55aoclM1CYL59Nkh0ny5/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FTtGxwdV;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="SmEt+mM/";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A025460A382E
	for <linux-wireless@vger.kernel.org>; Tue, 10 Nov 2026 07:36:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A025460A382E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FTtGxwdV;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SmEt+mM/
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA4AAqZ2928594
	for <linux-wireless@vger.kernel.org>; Tue, 10 Nov 2026 07:36:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CUqN75cKWzgabTOF6ENl/PYaMqYf/ZoDoIbx/U7DSRs=; b=FTtGxwdVYRKzndWV
	ivYp2VHwpiFmPViWn7ItXR5S5Nt3jLSy2sEjkEMjl1vRsRtqZIqKaE/m3+dpxVwy
	27QEjgIWEfF48khmdESc1YM2ZknevxHJM+zfnPB9tIBn5nNpZmEOXzl82533Do3O
	vxKGQo4PchCW6SOmmjQMd8Pf4Hno2MrX3NCbuTX6fvnm2l1UG7irQOusOLpegI5u
	RoGsjsytHBuI6wKDtCwkEAp7dFXjedQyujjo4/gM13GibpWiNiw/BTGWIEfAnnIN
	RtvnWxbzrQ6aZkagjpLyjnTk6O03ZG+dFtNM/I3k2M4CPNAIp+Kfkglr0REDuIZp
	mxIvAQ==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hufx83mg7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Tue, 10 Nov 2026 07:36:51 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1b3ae327c55so1056993c88.0
        for <linux-wireless@vger.kernel.org>; Mon, 09 Nov 2026 23:36:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794296210; x=1794901010; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CUqN75cKWzgabTOF6ENl/PYaMqYf/ZoDoIbx/U7DSRs=;
        b=SmEt+mM/UwLRgP6euabyoTCDX1yOE3yt9wU9BB0fqRuyoa4NCh/ELTx/tCcVa0WggP
         /5twMXsBhzui81bf6pljvdpMOiUmxp4hJWN0oJ6UyG9gNIol7y3tG3LNUOlHPhEkCeKz
         kA4olruq/4EB8CgkOJDPvqd2DySyO8b2AfQy5/vzymIGU+3ZdV73duSxNsFOXpfT1CyC
         nnuJ+JaKMEBv087OiZUD7nPCe5Km9QbZbpPQtSYK0OIfA/plFRw5Jmv2b0RngrI00XiL
         FRRiHjcs4sepFlxcbMpHq1GlV16QfGSLl0Ktmsp15iRqI08du55Yi9vcnea31KtxGae5
         Wy5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794296210; x=1794901010;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CUqN75cKWzgabTOF6ENl/PYaMqYf/ZoDoIbx/U7DSRs=;
        b=d0BmKJG+pOjjK9ht/D5bM1xWWUN4TpMKmVYAXo8mooz1keZForuRZxhA7pL05BnvOy
         ZNuxbCTEFQux0fZcJAjGh/TY6sDuVEDbZfvn0MA+w0XqZtNHG3t9QNjUaZ+GymOOz+iX
         XbpthzTTw0I8NVYV9vWYY511X8Axy3tudnUn5cCscCh/HVahro+C2JgfZCh4kYzrGp/7
         QdlTFSojy04CufsxrRuIsycpOIBakoBPKc4DdAbd7EjW03ncu/TM00VlUmzhZprwcrPi
         K24HZGlKjHF/4qloWKzN9pVxEEY4WF6NvUyBIGejInKQCe1nbZtbLHDm+yY3uDTX85k6
         SYxg==
X-Gm-Message-State: APuU4Z+hz55+RRpQM39UYbi4TXjxw99R9i6gXa6K3svj9uEuS2AYnbDa
	WsE2Z0sCmuIwhy96vq3gVuj+AHitic3ZDMJm6g5E7Sa58R/TGeDmLiSIiRVP7juDbs9gxd4ccZt
	FtT/UHmTezXscdqntUyQhd9GSi0UC4SDMpuW9i2j4lifk5GLJ0B2XPolDGj0DpIvF5NJfHg==
X-Gm-Gg: AYBFou0Ix4H9QmWEtWmytH1SrhTKwPG6YCfm8ywDafvUSvSHKgd/Mh5sAhipDqt69b/
	rtxqIjp05zA+GfbZrJZpPQPEq1cVjv5injPEiiPgbT7DYTO8T1pEPbnuzwSWdmGURvliWxUW77V
	iS6+M9nAvV4jNsKlMCtQcKQyXjFJjTUbKMbjW+KC1D4T6xbFHB5MlmsUbo4oj7tEHnfAq/2tS1n
	6NJXVRu5edefxDgalN8DK73wjeWa6V3d9uo9p7AmXWt/Kb66Olgj7zsa9T4paljPsxuXkYRJ/c8
	KZVsJongdE34xSeT/KD37CDzBxGLOTg8y5aymJ597QXkC5BdcYPPao/qKpxCv/sd9c4a6gsY+ca
	YYfTlNhJkgSBk6a+VSTkkuN2TvjAtJvwC21JzeTvjrUgPDFUteo/2xUTwcrWQjswz/lRlDfKB0x
	Pl5aG72vVhrv2z3w==
X-Received: by 2002:a05:7022:170a:b0:190:716:4822 with SMTP id a92af1059eb24-1b3b603aeedmr2309291c88.8.1794296210335;
        Mon, 09 Nov 2026 23:36:50 -0800 (PST)
X-Received: by 2002:a05:7022:170a:b0:190:716:4822 with SMTP id a92af1059eb24-1b3b603aeedmr2309269c88.8.1794296209582;
        Mon, 09 Nov 2026 23:36:49 -0800 (PST)
Received: from [10.152.199.23] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b56c4e88sm4591558c88.0.2026.11.09.23.36.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 23:36:49 -0800 (PST)
Message-ID: <d1d6138a-f8b1-45f7-8761-4647a3ddc004@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 13:06:44 +0530
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
Subject: Re: [PATCH ath-next v3 0/2] wifi: ath12k: accept what newer QCN9274
 firmware requests at boot
To: Goran Sustek <gsustek@gmail.com>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org, Nazar Mokrynskyi <nazar@mokrynskyi.com>
References: <20261110002121.90167-1-gsustek@gmail.com>
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261110002121.90167-1-gsustek@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=AbYkjHXG c=1 sm=1 tr=0 ts=6af2c993 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=IZxZDk6eNelpyKfexPcA:9
 a=QEXdDO2ut3YA:10 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-GUID: Xj-bQAAkpHzANG7pb6-oaR9EyUVLxXig
X-Proofpoint-ORIG-GUID: Xj-bQAAkpHzANG7pb6-oaR9EyUVLxXig
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAzMCBTYWx0ZWRfX/RfqFTe4beTh
 sBhOB+udlCBNEwE/1Zo3rbubClZDAvViK1lJLBTOTocCv128PUYIZxd9ZFjgsbTFPqHCmvu7NIP
 qo9J+Vg8WD6HXuzUSXgAIvKgE5uTBQg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAzMCBTYWx0ZWRfX9W43LAPSRTDk
 vKmDBUvC8CGSPYmQyFi2AsuSXJyIeBsNFVigPyFLdfQFzlgSQX+3IkvNI0MO16XOsXcPe+9Dzk2
 YU9SN+n4V8forqlRGmFiMdDfBxj7V9EZRo5FQQbUFY0tOPZ++Vz6/69P/GSAOp6iOHYBiA6kXHi
 C/DoT/JE4pj6E/0X4zeXVwwX2z1eLngVzmvgd3JcigEvAqNL0jrUf8NqlN+OwEpsU5wW6s2npZs
 AsP7iTKlX38h0tqOjg7wtJixMCcvg+iOwhiQEKBvcMP0BApoBSIN9hBYZ2jw2mAlL5TMvyGvzjl
 Fcj4ftcwKbYIn4zfCu8U/ScKmM+Thslafw6HLg2JI9RwyzJ/qBo8uNxi2TpOtjtYQISSemB13i7
 aS+ZAfa+4gslaDGNrFMlYz6yKa9tj4y0KheteGjfXUSK7KYZqkgrneLpbvDLJSel62G5vKhjTKi
 U7TKs0Px8DoZ9g13d6Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 bulkscore=0 spamscore=0 clxscore=1015 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611100030

On 11/10/2026 5:51 AM, Goran Sustek wrote:
> QCN9274 firmware WLAN.WBE.1.6-01243 requests two things at boot that
> ath12k does not implement: a target memory segment of type 0xa (AFC)
> and direct buffer rings for module IDs 2 and 3. Neither is needed for
> operation. Today the first gets a wrong answer and the second aborts
> the parse of the service ready ext event.
> 
> Patch 1 answers every unsupported memory type with size 0. Patch 2
> skips unknown ring module IDs instead of failing the parse. Both keep
> a warning, so the gap between firmware and driver stays visible.
> 
> v3:
> - 1/2: clear the size in the default case, no AFC case; keep the
>    warning; describe only the response change (Rameshkumar Sundaram).
> - 2/2: warn for a skipped entry instead of a debug message.
> - Rebased on ath-next.
> 
> v2:
> - 1/2: do not allocate the region, answer with size 0 (Rameshkumar
>    Sundaram); former 3/3 dropped.
> - 2/2: commit message and comment reworded.
> 
> v2: https://lore.kernel.org/r/20261102200235.48973-1-gsustek@gmail.com
> v1: https://lore.kernel.org/r/20261030220836.14164-1-gsustek@gmail.com
> 
> Goran Sustek (2):
>    wifi: ath12k: report size 0 for unsupported target memory types
>    wifi: ath12k: skip unknown direct buffer ring module IDs
> 
>   drivers/net/wireless/ath/ath12k/qmi.c |  1 +
>   drivers/net/wireless/ath/ath12k/wmi.c | 43 +++++++++++++++++----------
>   2 files changed, 29 insertions(+), 15 deletions(-)
> 
> 
> base-commit: d0fbb39d65dc9dcb4175fa6b23e473dec3670f4d

Reviewed-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
