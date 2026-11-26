Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795710035;
	b=ltrQF7RMrT7Jwk9C2CfoaPFqVLA1YmjZdiS0DzYnSlXWsWESG57YKKtmNqcKqXP1JoMu
	 bl8DthcsZq4O6tULnIq/+zCr8HKCEWXBFhDeXeWPiGmcre4TZp5OWdYWt+OL5+W4ERAi5
	 BqVcjYrNMhWlTjUSlp8JLJXGs3IGeFe7EYjSabntj/W5PLT3+RUdDgevyLqcveC1itCTX
	 wIuw8mkvjZhrvGBi+tOqOGaNl2fwAMwZaRtePIG0ywQMxhnKGihBgjGbWZVSqApfrzs8h
	 EE9gjXlKHXD9LTRXkQou3ls1ghLYpryPJzqF5RjrEq7m6LCacHdYdQqElasCpLIIAIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795710035;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Ta+GOAZXlWizSDSkAj84yRXeAdlLkOOcJL2DLqIsjgs=;
	b=Fk/9b1Wp/4XJR/5bDv9wInvlvrcokI40Cbcnz4hb6yFADZoIYD/RxjI9Pc0B5ffJY1Qw
	 F+2e38ztYfLrX+hZ2odpOyoCJ97bYSGAjt6FijEvu2b/uHYjH8w7UC8aK0wQblEUfm+7f
	 CBkDRURUrl+SNB4JYR6CYd5W9qzGWUU8GjzosM9QAiMKKqgj7jSQ47QCyzLFz8v+iWsFH
	 oj54glfsUlOJPCIzBNJGBioI6pdlIWNV+covP2JCGBXNxA7S9eJr8V1CGEdd+pFIU00pV
	 5Z2cuZoZrno3UTsZUfYQF11EfHUTzGDX4eljD8w8+QK/51LtT68ZRfj/AjtkQOsPUog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Tfj2ndES;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jpIWQhzb;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6EE5606A326
	for <linux-wireless@vger.kernel.org>; Thu, 26 Nov 2026 16:20:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D6EE5606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Tfj2ndES;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jpIWQhzb
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQFu6G81847843
	for <linux-wireless@vger.kernel.org>; Thu, 26 Nov 2026 16:20:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ta+GOAZXlWizSDSkAj84yRXeAdlLkOOcJL2DLqIsjgs=; b=Tfj2ndESDqpk3Z0x
	1nvqz97eAN7YFEyhY7ZCIC5ExzhBsUZsFcHBB6Fl6fScBL1NhZSM9ho97WMldItt
	kInfobEnH1HjfZ9AxQ7wAgDkB2JepKsEkzi2ae/1e8fkAux1JSvO74TxEq21KVm+
	T1TxHH08IFg0B4PONnYfYtv2va5BWTAO1VYtH9x0I+nmh/2R1kEMUkuxj4b5b4zP
	HKJwmMDPRB0FV4AbPrTbaGu9kmkoO0kLHlDu2mf8R53NapcewOquxf0UPWT+p90j
	WDz6h17sQSsKrOm73YhG2Yalp6RlsblK4R9ScU+TPR149kbpffyau4kQ4HFVaDnQ
	TeHTAQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6fw7t0pq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Thu, 26 Nov 2026 16:20:33 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3854627c1c8so9741171eec.1
        for <linux-wireless@vger.kernel.org>; Thu, 26 Nov 2026 08:20:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795710033; x=1796314833; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ta+GOAZXlWizSDSkAj84yRXeAdlLkOOcJL2DLqIsjgs=;
        b=jpIWQhzbiLNVRSSPM58Yo2qxA0kjqjXqrZdDhdqlOD1naN6JS0lLDH5/unYs3+V1ho
         eVmruVZ4qTXgbLHnhh9yXuLymWMkoBvMhICm8C1dtyfgrlYDYxMQed7AmyzojAW6es8Y
         Ie9i5QFjs7iIVK8z0/qgrNO//Bs88v96wlC3ieZMpnuVg9ToOie9uhDaFXzwqG3hkxrJ
         axny/ySvGRK6JYxKw9RuGU4ON2CHVmg5/PuQCWTFV9A+06RK7Xb9EITw+zsXDN4zsBV9
         RsGcNFWgNlOEZ56XcCgCmaModq54XYksO7H2QbyGc3bx1Fb4eVMptJG6Wwzo/qCbVxUt
         KPrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795710033; x=1796314833;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ta+GOAZXlWizSDSkAj84yRXeAdlLkOOcJL2DLqIsjgs=;
        b=uHOoE6483rkJ3QBN/shRJBJAA7DPu8tvC9d5voF4nCMe7MVr6vQUum7L678WoHbXVi
         hsQ0SJCefUtJXkwLmlzqlpqPfhGMqofBjpk6WMNihBi4tG9FLGmQ/1AjUNLeRRFJxSLd
         Nh+GDhTVYAi5LZ23MKjBXPCzpgG+/Qspq4ZSx28V+7pSTajUaXUA3qceF9+17WJ467Hm
         nCxowSifBh+Qj/mHhGjzUpLBsYmRxyTbPEHcvmndcw4NY4Vpkuaq/H+AB5WJOwgJ3Thd
         8VL/MUawyrNmpzsIiWmPQtfFurf/iD7gSDstg119GyGPokCrogVM6tqkDly4/Yiiw8Gd
         KnLg==
X-Forwarded-Encrypted: i=1; AL+hErHszi5/Qmz+ISABSJOyS82OPlBG3eNno9TfIpEGlx8Wpw1v8gSQ2bFMzF8iqrkcVTEnJsv0SJ+QGio/0yCFIQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z+WfjJVJk1DSBIpl+/gg9h2+7uZYHHQfgIyBf9zKPCtsSJgajhV
	65xErdA4iMceZbSadHJZ6/y4XBNEfZ5n/ZD55f86P0USvLFajzru+GGssG82CfJstJfc4FlcYhK
	hLElCZ59BlJGaTzERdJLJxCPVQ9w7/7NHSRhx+j1sUG8dwhS+xgxx9bsPUJYM1F0HjAvCadqYkY
	JW6A==
X-Gm-Gg: AZFdTZeuui3nDN9TRFCirwfv7xWtvYAK0aUkZg9fpzWE+LA7R97AOqFnVHD5sYfSUb6
	EhqWBI/PuIa7UJqJurxhMDwCVj9Q8VcswD8P0qar4CLlx/eMLebLUUUJM4pm2mnX9g7HBLArydM
	XRSqRPMFlAmR2QMmwTMY5pz4wIHPxrRDHZZksZBTmuIAe5FvI/APzts1lCZzCY4I4C2jF8PQisi
	2ob73EDabVmMyj5xuD+VDvGhB4w3qMxfPdWKavtnMchuI8be46ue2vW5NV2MRC362GccTqAhaLU
	M0LlQJTOt/OZKU+AzW2uonxiLl0l/z6pzuXYlfuwjhkOzqcr3KeDJPEIo5so8oz9l4fM2ujS6K5
	a5SeiWMrLs+9ddApCgm/Y7L6sQlDTWcFNvhYaIcS0IOXSm5fr5leTkMeYomq3RPUV9KZ/cc3o7P
	DuDFc3PKBqjm3A3ysf9A==
X-Received: by 2002:a05:7300:7c08:b0:384:3123:a0cb with SMTP id 5a478bee46e88-3856ff5b880mr33998818eec.27.1795710032354;
        Thu, 26 Nov 2026 08:20:32 -0800 (PST)
X-Received: by 2002:a05:7300:7c08:b0:384:3123:a0cb with SMTP id 5a478bee46e88-3856ff5b880mr33998770eec.27.1795710031591;
        Thu, 26 Nov 2026 08:20:31 -0800 (PST)
Received: from [192.168.0.3] ([49.204.130.51])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567daaf70sm66591004eec.28.2026.11.26.08.20.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 08:20:31 -0800 (PST)
Message-ID: <1bd9d8e4-4e00-4cdc-b53c-50675d6856c9@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 21:50:27 +0530
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
Subject: Re: [PATCH ath-current v4] wifi: ath12k: fix DMA direction for
 re-injected Rx buffers
To: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>,
        Jeff Johnson <jjohnson@kernel.org>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org
References: <20261115-ath12k-fix-dma-mapping-for-reinject-packets-v4-1-27efef2890f8@oss.qualcomm.com>
Content-Language: en-US
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20261115-ath12k-fix-dma-mapping-for-reinject-packets-v4-1-27efef2890f8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA2MyBTYWx0ZWRfX/enUWCvaqfzr
 yKa/6eKIv/HxZ98jm0gPQWKjNqmbIE9GkfIU0AbcugNbZbnQW1xcCWx2PAbl3DmWmEyFD3BXkXc
 x2j0sYnZ4hqQ7BQ45jukT1bImKixEm8=
X-Proofpoint-GUID: qWe-mLXL97GDvejx-TZoyOpSrDAtLJaW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA2MyBTYWx0ZWRfXyE0mNz5/y22O
 T/iYdZQezGtS9rmAq6J6rQ7kcNMbSRTLFwin4b8ydAG4n3fP4xGB2k+r2aybMd9DwWXBej4BidT
 Rv6LokUhYgApmfCXj3hWQklOv9hNt6aRE44qVQYRNiMDM4u3Ll9j/y5OOssiRR8g6RZxFSbGUpi
 31jXjREqVQnUvWoDgeJ3TQjHAi4k+A5vw+j3ChgCReeKRHYZ8M7lbyhK7q7lgJDN7Do8MQUTCDa
 99pwBE9mma221cqxcRu875K/jOm1abfnEg7cEeFDL2AO6P6KvGP+zlF0rh2HECqUgV8/kdV1bjV
 CLYcfKFYCElILBKTjQDqDvgKrDL/H1hnSWhDxJ/uvjyVHSTbtYZ3K0Qwkqv/Udhy+TqtY1JJuDv
 ZU/jrLiNcgvzun1DdMB1DN9YJR8hLfQ/hD99Xjr/MI7MQ3RAuPAdbjaFkPOKz0e6P3N4fV1gm48
 KNrinbn0RORcyF60A2Q==
X-Proofpoint-ORIG-GUID: qWe-mLXL97GDvejx-TZoyOpSrDAtLJaW
X-Authority-Analysis: v=2.4 cv=ePeGH3p1 c=1 sm=1 tr=0 ts=6b085c51 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=JcMdxy0ByqZMvlM8ZepLMg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=kxk9WyqwN4Jf3OentSIA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_04,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 malwarescore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611260063



On 15-11-2026 14:30, Lorenzo Bianconi wrote:
> Defragmented MPDUs that are re-injected into the REO are mapped with
> DMA_TO_DEVICE, but all the Rx reap and teardown paths unmap them with
> DMA_FROM_DEVICE. The DMA API requires the unmap direction to match the
> map direction, so this violates the contract.
> 
> The mapping actually spans both directions, since the host has written
> the buffer before the REO reads it and the buffer is read back by the
> host afterwards, so DMA_BIDIRECTIONAL is the correct choice.
> 
> Add a common ath12k_dp_unmap_rx_buf() helper that selects
> DMA_BIDIRECTIONAL for re-injected buffers, identified by the existing
> ath12k_skb_rxcb::is_frag flag, and DMA_FROM_DEVICE otherwise, then use it
> in all the Rx reap and cleanup paths. Map and unmap the re-injected buffer
> with DMA_BIDIRECTIONAL consistently.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3
> 
> Fixes: 33322e3ef074 ("wifi: ath12k: change DMA direction while mapping reinjected packets")
> Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
> Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
