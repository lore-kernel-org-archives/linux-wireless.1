Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794292603;
	b=sbLS40e/CBd1Ru8fTuxjAp+wU+bB3gV91z5IYkviIpBYObs0sSogn/omSacOFdwdJLSA
	 eMydl8sjy7iPRHn7ZUvg7LzyWS6uBP19c6Ev0Bf+erlqBf9dQ2P7hV3iwoxh4jlBapcXf
	 fWuz3HCDvral5qAi5Sk8ECA/KiJGtiYrmQ+Ar9NJalhbxw30wsT7+vGR41G1OVYuKHQDf
	 bvFABaukhx0WnvK0pUbcDagqWy0xDM8woJfY0pauytI7jJJ8FezyAMJekG9fU7w0sjzUq
	 8bEoxcFj532slUUSWgJU3FyRSODaSc3oYVaeMrgJHnpc82Uv7H2U6jBcQK7rQvuCosg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794292603;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:From:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=cnAFPAsLP3mQnmHLN/evzK6z0gz3a9aN1Zrlr7RDLyQ=;
	b=iOcs3+b6G22tzEUVtXue790aDxmvnCNXVsZ7QZZVnNado+wtj/pRBGy1Bl8QBkODSah+
	 Fm6JSmfX/fcbhKjEe/NOLA8zS2DcqCeDUbjKfBTEN3VYnMuADNECin2CaqXtQHRRH8tKI
	 /aWMFCAXB8JnaAniJS7mVMktxxkyAmjohm3QAJOStam9AlSx54I3wmjN+1hEMB1RMEIb0
	 lQJ9jgXPZiyjKlINdnIkiUW0FQfICjw0xAbC+XfB9USIN9auaU4UWsgwvM4xWIMG3SvwO
	 +86CB2CzfQ8NGFkIPtrZcTRL/CeOlBHe3IEhFsjNhYVvD7jLzH94Cqf6f8MjJgqiOEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Cd5kwCXV;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ly7yBG62;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B338D606A325
	for <linux-wireless@vger.kernel.org>; Tue, 10 Nov 2026 06:36:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B338D606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Cd5kwCXV;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ly7yBG62
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA4AjKM1958917
	for <linux-wireless@vger.kernel.org>; Tue, 10 Nov 2026 06:36:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cnAFPAsLP3mQnmHLN/evzK6z0gz3a9aN1Zrlr7RDLyQ=; b=Cd5kwCXVhFHyBTHq
	lBSX4nmQ/vIMNz/H9KCcNE12FbablzeYvKawjFkq1BOmKl1CcIFo9EF6FyHe3TeH
	ItN0c/B0MJYC4c9xWyDZvhi6FC5Vj5M8dxtd0lqj68X+2hJKFXIXDrwba6nXSkc1
	4i0uP+uu+ztMMBaa9FL0RzdehwKslS37VZNxk9vqYlsTX7Lof0XVX1kb5Iy6RUbY
	hy027AjCeWa3Xvk2OaGIKPzyC9PknDGrTBv8wF8PkZBWxgtFFRjRGhapaFM5qzTa
	Iv6DliTTRDY83kCgmIiyiCGS5vDz6V4rFMwmQbLj01ciaNbnGSBSRG67V3CPQ2r/
	/Cr5bA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hucydm21e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Tue, 10 Nov 2026 06:36:41 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3ae7faf4ff7so2288100a91.3
        for <linux-wireless@vger.kernel.org>; Mon, 09 Nov 2026 22:36:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794292600; x=1794897400; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cnAFPAsLP3mQnmHLN/evzK6z0gz3a9aN1Zrlr7RDLyQ=;
        b=Ly7yBG62bfqsck5xrckF36SnE8UdQ3545lGNI70721mobCPJPlROhAaVSCd7pue13a
         7qNNsg+gR1RsHPOiIc/hVbjR5yB11az3EYsgIj+RfKZGKObUQhGwiiKDnb0jZhGXQfuk
         VUFbjTYRQoBO+6hRfNAs1T3CmeMCT92joFpq8B+rcJtOySiaJ7Ny22flGO5aoH2sTNRR
         R1vW6JC0SP2wXqKlXI1CquwLbMdnIfEB98IyBzO18N4bv5NUPQXsiDtuHM+zqTbmxs9l
         1tUv8FS0hexkB/owSigKURllm0yQDBZ0aqj/tidgOMOgOIw2FXaZX0AWzLQld77RtTcB
         pKAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794292600; x=1794897400;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cnAFPAsLP3mQnmHLN/evzK6z0gz3a9aN1Zrlr7RDLyQ=;
        b=gq/GXxCIaNgQ1P99SXo/2AE+BEMT/MQ16j8qXtnlaDw7q3cMkLfnhMUf9vfbW8ZDso
         ovMpTrAPph9BOaFku092QFI/adEAAZ93zZ05tdZTj2RPRe/xDDTy5ReF9iGjZSSoHZUo
         +th1wSLencLcH64cK7V4H7nmRE+1Jup9V09zCtSKw7toz4yYRwDk/eXdqJdxeCSHC7iO
         7r2I3Bnqaxj5bFhBHitQV8p4zFZbzyO1RcvcmowOffB/WA+0vGGTtvW/hzQYXsrkQhBK
         ZJyFYWKCEER/UE4eyRnaUwgkrL7PLlfa+AeQNT9ke65kJIIj4Qos6c/BVbjUMkscVDe+
         hMyw==
X-Gm-Message-State: APuU4Z9ZRLlfUBDUpNEOWzINRpF+fkctIGOzyil9UVJWF5TKd6w6uekn
	YqKJfTNpA2iNwLzparMkS4jhGg5X7ms7jBxcQPW2S2sa7KaqS1RKGwDCZbtYLX6n0Zoe0uTexif
	8jS8oFUpKL7AxRXyFlTYEXbHpWbHdOpX5cis+E/eL4ITBaw4Mvtetk/bnFYbKwNb9u0Rxwg==
X-Gm-Gg: AYBFou0E4/4Irc1cL5xpv/aJnU3JUL1tBS2Cr6Nh7neJ6N1NnP1/qfI5zRzwr/kvc1I
	V3OeXne0WVfbmc/A0ymXHJN2fwV0mmPIhUT+RAZVWBSqYmW5CbsH1pD1cQ0FK1bb1TTSMCVpTW3
	PUo9EhkNH+XEh7qRcqwLutin3FSORI+1Rjganex8gnsPZaPoT3fFuUH6sUri0StT1MZWkGAQamM
	pmBK85FdD2o1oXCjCIDSWbgEaYVXCN2/rXX9Da1MAovKjqS3tQeWvQTcFLkQlYg6nPQxrjNW2C/
	NBKQneuduJlpmSJKjXSVY2XxlUyvCHow+dse4ytdmYCIatxvTiN1AdCb5fder5vEfRidH6vExYu
	gFN8grRFxfE6vh3tEWacc2sRHMCFw13NxG7Sr2id9h9SIuM4xYNnb8yParVL5WXUAISD34NFBZ3
	8k/7f7AhZRyezK1Bl8evg7D+j7Ilm1cSYlQKVnvmN2pehExQ==
X-Received: by 2002:a17:90b:4e86:b0:3ad:b7d1:8631 with SMTP id 98e67ed59e1d1-3b166cc02a0mr1865034a91.17.1794292600478;
        Mon, 09 Nov 2026 22:36:40 -0800 (PST)
X-Received: by 2002:a17:90b:4e86:b0:3ad:b7d1:8631 with SMTP id 98e67ed59e1d1-3b166cc02a0mr1865014a91.17.1794292599958;
        Mon, 09 Nov 2026 22:36:39 -0800 (PST)
Received: from [10.133.33.180] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b16790ff7esm2546598a91.9.2026.11.09.22.36.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 22:36:39 -0800 (PST)
Message-ID: <c78e9194-ba3c-47ea-8876-9bf6bba4d7ef@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 14:36:36 +0800
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
Subject: Re: [PATCH ath-next v4 11/11] wifi: ath12k: use link_id_map to
 resolve RX link id for all devices
To: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org
References: <20261102-ath12k-logical-link-id-v4-0-f4c7807c299b@oss.qualcomm.com>
 <20261102-ath12k-logical-link-id-v4-11-f4c7807c299b@oss.qualcomm.com>
 <1107c457-74ab-48b6-b45b-afe4a868a55d@oss.qualcomm.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <1107c457-74ab-48b6-b45b-afe4a868a55d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAyNiBTYWx0ZWRfX+I73aVzfIz3e
 6OGPnnggrbvfX2yOcLaYcOwGzuZbYb0It1vqsBxA0ojIN2ahMqHTOr4C2IRGS6623VAnVHa5Iw6
 Uf+mXmo3h3TuUpDWFDFYKJ5HcyYkVDo=
X-Proofpoint-GUID: dMqDtg-hsbZAts2aD5ZlFu-w4IFA0koz
X-Proofpoint-ORIG-GUID: dMqDtg-hsbZAts2aD5ZlFu-w4IFA0koz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAyNiBTYWx0ZWRfXw00PNb8EmgAj
 9j0iPl0Bx09QIQlBG3/SKcNyukZ2MCPwYeMcGKxLuLNGnIPxtR2Rh83CL9tVA1flFlysvMtutwY
 Io6iP4KowhfoTP/K3lQbC90s0JD6EKm3LbAdphIjdyUvD25zw2BxcmAcsJ6OHZOi12MNYU2/O9j
 Kzw5GXs7s/aG2S9m41ITwQrKsIm3g5spHzRANTHyz95kgQ2A4Lw1CFKiak0mXr49X4hlvHr2122
 J0+3dFC0Cm4UliDNIPxC6isCiHPKAnrPNWqKqNjixzRwtIqZfSBr2raOM9rfpqCJ6q+rSaKte9N
 qhlnEu9AOleVUPB1eSlfznKMXt3iTduYY4pZWv+os+/X406oENuFjGyvZqQzRCipGlmzC1ocr2r
 u/eYOjaB6vGvPdhrEUJHEBqbRmCFvfYPa6X9tcehal3+wny+oSAr821MbLRySi5S/FxQexC4yrQ
 Kjq5mIX+xXJ0tiFR5Gw==
X-Authority-Analysis: v=2.4 cv=XuRvqlF9 c=1 sm=1 tr=0 ts=6af2bb79 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=p20JRixKrNupFYNNBvwA:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 adultscore=0
 suspectscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611100026



On 11/10/2026 2:07 PM, Rameshkumar Sundaram wrote:
> On 11/2/2026 12:08 PM, Baochen Qiang wrote:
>> Commit a2fe9dc70f3b ("wifi: ath12k: Fix low MLO RX throughput on
>> WCN7850") added a set_rx_link_id() op so that each device could resolve
>> the RX link id in its own way: QCN9274/IPQ5332 index
>> dp_peer->link_id_map[] with the hw_link_id, while WCN7850/QCC2072 walk
>> dp_peer->link_peers[] and match by peer_id, tracked with a link_peers_map
>> bitmap.
>>
>> Now that ath12k_skb_rxcb::drv_link_id carries the driver link id for all
>> devices (the hw_link_id on QCN9274/IPQ5332 and the logical link id on
>> WCN7850/QCC2072) and ath12k_dp_peer::link_id_map maps it to the IEEE80211
>> link id, the RX path can resolve the link id uniformly.
>>
>> Revert the set_rx_link_id() machinery and the link_peers_map bitmap, and
>> derive the link id directly from link_id_map[drv_link_id] in
>> ath12k_dp_rx_deliver_msdu() for all devices. The NULL dp_peer guard added
>> to ath12k_mac_peer_cleanup_all() is kept as it is an independent fix.
>>
> 
> Fixes: a2fe9dc70f3b ("wifi: ath12k: Fix low MLO RX throughput on WCN7850") ??

hmm, not sure here, since it would need to backport the whole series which is too large
for a stable backport.

