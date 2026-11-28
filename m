Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795872259;
	b=W2PUlvmEH+VuXwpgutIpATgz7LekCDGX05kdt8EGRVlYspZbuBewLtzLDzbbUQnBmVHG
	 mOx1USxi2D/k/aLCNIkSzQWBDbvHCyOXV+Qv3SQRuDy2G8QrCh7p0QRQHi6qvilVJwxyN
	 D4Thl4XjQSDzpqIcI9geY5XBhWgjkUdhVDOck6aJ/5M0ir0ppPL9k+Aupss/ZLFjoMr8N
	 9gg/828Gp4preiOiFAp2Quuz5XjBTP5E8ZnOaXW0lS4/RSeQ7qt4li0ZsfUAvKGFuhIRe
	 Kks8v9lzGm3yrMuhmkJcKGujsNygX0yr4TiM/5/Y5cQYpBhwnFhfYJq/ym4ucMwwdQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795872259;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Cc:Subject:To:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ACwliXaCJJD7FrV5x6q3pmOUcm99a/XLmBi1r3FE8HI=;
	b=NFY+bKSzybt7nG6aAZpyPRSpL1GtoGrZPohNg08Matt2d5axJci2cVnHZT8SNhZbUxyP
	 +deRzTFFqsD56SRga5y5tgPbC3bUe4aP5whnWP3MZ93sheFVNReOPf43YZy/rnAkI39HT
	 1tgoKWNldaCOnq5Umy5y3z546Qwlpa2tuX8tCzMOnTcEQOu5VjPMdXHZMplgWTAqvObhq
	 OJSEFFzX1SSHX9/K3EOFkJAB/IaBFS1x5c39oILZLfM+Do8DNYPO8IhSlK9DfsH8Lrrn8
	 0FujxtOHWZTpeQkPl3o1meLcRGzHglMRJnB7jV+tzx5yZqZW/6a3vivfaOyxdWrzuFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Wp+lF8yh;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="C3/LuVgG";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C892C606A325
	for <linux-wireless@vger.kernel.org>; Sat, 28 Nov 2026 13:24:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C892C606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Wp+lF8yh;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=C3/LuVgG
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ASAITAB2329802
	for <linux-wireless@vger.kernel.org>; Sat, 28 Nov 2026 13:24:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ACwliXaCJJD7FrV5x6q3pmOUcm99a/XLmBi1r3FE8HI=; b=Wp+lF8yhgd5EagvZ
	ZlGochIrvz1wwGt2IFybyBygUZLyxb1s5Z9tL29R9F8xYL0jjJvPMvpSgwZixvwr
	K+YsVPDZiSgBIg8eyaJECboDT8pLKLN/J8NmGNTXCRCRSDqVHf6TvyhJwvqEPwuz
	BftIJlqseFFJcHGD5/aEqfMWTejPGPBM88iqXG35/t9ZGX9qI1+siL5nkYoWZS9p
	4dZyaDSm5rt3jksBn3slUfXoKvvEh3QOlj4S1GFfPjk+HHFUyRsAr2chCeb+JbsB
	iqDLAMbJ2uM7SBylGs7Lm8R/5KDUvrAiJ4geFq2rkjJVbBNFM1jckn5eU7f9il74
	zmxp6g==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j7pj2s39u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Sat, 28 Nov 2026 13:24:17 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1b3b45597c7so879457c88.1
        for <linux-wireless@vger.kernel.org>; Sat, 28 Nov 2026 05:24:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795872256; x=1796477056; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:cc:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ACwliXaCJJD7FrV5x6q3pmOUcm99a/XLmBi1r3FE8HI=;
        b=C3/LuVgGTcePaC4pz88NV8NUt16MnlPSYJYOgosHb0suzhWYlGY+I8kisYBvaBFTqe
         6a2Kbp/nxwi2Q2W4CbHofYHQAWjIJ6hj8wE6bNQGFlGU/SQT5F7AhcB7P0HPT8vUK74U
         9w+bT5DBW1hSSpFTlRCbW890pV+2eHdGSpaQNB9ouuXp11/VNcv9KhWic19gKMIAphMP
         Ep+QEfu1YznntD45K8RCHZA6uI8GvO+Sf18+yaYpyR0Zm6FeptZOcfaWqCDh7HNpBi4L
         bQ7RVEDkF5HvAWhIcprdR6G7uArn03zTziiBBMI+fuHY9ye01ImWryB4bmJFH9eXG6lF
         CbBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795872256; x=1796477056;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:cc:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ACwliXaCJJD7FrV5x6q3pmOUcm99a/XLmBi1r3FE8HI=;
        b=bBqOjgs8C4IGWX9sF/T0dAyG7bRWZLMEDT0FlH0nRZnH7xZF2inahSjp8Li8twvyeX
         iXBWZFNBd9lFjPVo8vc/ukpxSiGz3LLWzlx4q8bOLD2GwoR4jx+25YkygU/5UCbLPXgd
         OvqPd31QX709BUQyxu3O6WYKCfy8wXlOenpYhsfij1kTG02PUtL1FHf5+TO5K4kWUEks
         l5twnhk6xjYT20DJnDFKu4sdygsmqZmFB2NPA1mRCelB2OQRnzg/FV5hHUONdAu4dHu0
         0q2cw+5rtk2FswJJXvNwQhVTtgO5yhCg2Od+lUNoZTv+ZfG07iYYtpx7VtxNkDS60JGf
         pv1A==
X-Forwarded-Encrypted: i=1; AL+hErGNd4FaK8+6aI4jcbfcqs066jtsqZDgmQKmZzZd76VV5CT7KaBl/pjbRUEsPoNN2HiS8C6dkAq20Tw2u8HGug==@vger.kernel.org
X-Gm-Message-State: APuU4Z/jmB6hSfWN/Jl5ATtplgBVlZLYvtFAtAH1vilgFSV9PAoBBw/i
	F8TJJwG4Zblfb3grZ+6fPheywaKykcPJ+tNvPVv70msc49nhWXT2t+BPxpB8Zi7vPTBccp8pt72
	rSDd5pLQpwH/GSc0nh+O7pI7Pu6CPBcRbjwXm8M0SfV2H21FQMQRciHgWFDAwJ804E905gQ==
X-Gm-Gg: AZFdTZfEy8WeP6cYZvrrtqcGbjkNqmDHRoXZ3dfkp1Cxphwwzcz3WUScGJCuCFSPAlE
	SeAZYTkNib96jpDanM9b8iF8Fm1b44k629QV+c2Bawch8FOaM15xID+AvsYkvrhXcK3O3sgdDBO
	D7WoTc+610nBX8BH0ksTBXoZVN7DEAjz4F9ddtUqA9Qnwqi80dm40Lo/P4g0rtCh7Ik9uK4aqqh
	FtRFtBZ3nwVyEpJnDOL9a3Yg/5U37P+d6gztM20sYMvwlPKks0Qe9KGjM+yh8zXuj8umIJeemh1
	Rk4lNaedjsN7ZyZ9lJTBlDW09vzS5NMDgges/ZcBCXG1euMn8j5UEdHiSnxYKjGVIUGSLPrrST6
	GllCVnUFhxo5CzCt+9uiFebDG8LYrvn2LJfSFaIPjp2ZTL0XpnvNVl9EmoTJTR/JbVqghXEmEPZ
	Tcni5LjOO9N/9UGMjLsw==
X-Received: by 2002:a05:693c:42c2:b0:386:bc8f:b603 with SMTP id 5a478bee46e88-386bc8fbce1mr15633671eec.38.1795872256508;
        Sat, 28 Nov 2026 05:24:16 -0800 (PST)
X-Received: by 2002:a05:693c:42c2:b0:386:bc8f:b603 with SMTP id 5a478bee46e88-386bc8fbce1mr15633653eec.38.1795872256027;
        Sat, 28 Nov 2026 05:24:16 -0800 (PST)
Received: from [192.168.29.140] ([49.47.242.76])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386ffc4ab65sm269036eec.22.2026.11.28.05.24.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 28 Nov 2026 05:24:15 -0800 (PST)
Message-ID: <bb9e02e9-6738-4aa3-94b5-817d01c3a747@oss.qualcomm.com>
Date: Sat, 28 Nov 2026 18:54:08 +0530
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
Cc: karthikeyan.periyasamy@oss.qualcomm.com, jjohnson@kernel.org,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org, rameshkumar.sundaram@oss.qualcomm.com,
        baochen.qiang@oss.qualcomm.com, quic_cjhuang@quicinc.com,
        vasanthakumar.thiagarajan@oss.qualcomm.com, quic_bperumal@quicinc.com,
        kvalo@kernel.org, quic_pradeepc@quicinc.com
Subject: Re: [PATCH ath-next] wifi: ath12k: drop decapped frames with a source
 other than the station
To: Julius Bairaktaris <julius@bairaktaris.de>
References: <20261122210809.2087836-1-julius@bairaktaris.de>
 <e019d2d7-de8d-44aa-8fdb-e6770938c409@oss.qualcomm.com>
 <20261128115312.428133-1-julius@bairaktaris.de>
Content-Language: en-US
From: Karthikeyan Periyasamy <karthikeyan.periyasamy@oss.qualcomm.com>
In-Reply-To: <20261128115312.428133-1-julius@bairaktaris.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: kCtX4MF-n0n_qqj8xU8bVAMIkyw0Kanr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI4MDA1MyBTYWx0ZWRfX0xqhv2hQb/rB
 6n5X6M5sHVYI2/AYumSrO53Dwy3n+jtquynCCeNpQ2ORconeEsE7lDMxNnvOjNqbYvr9ZkZrhvD
 QFGi9vU/BJwgPQqHTyz9ZyEpIJd6LkopJEqqTACqRpX59EXneq4VN7Llno/a9Ah83K1kKLgeLlG
 SKp2oYd2RNN805WNh4F93nM6l9sdE9OC3hdFj65c68zoz1P9dSBGKZ5unrfAuUowoMkyLGDC3a2
 q9oDls8Pu1YTqcagD9vP63LM4Ujo2sYuLTPzzF/eLNRAcFFP3LohJn65gL9PWh22gUPqJAh5UNp
 UGgjwrD1r1krWTbBT+6HuptcbohsJdntGQpBTjxCo4DVrMVXeIuo6vy0wcSQ2EjkOKvkyAJMsHK
 rNDCW8aWIA04/xG9xXESOy9i0Ii/9lgqkcIIJqcKrfeOmFvtg0Y/O62XHUlfvQMKlnd1c8NqbOG
 U82KELicTAHaNPoxXlA==
X-Proofpoint-GUID: kCtX4MF-n0n_qqj8xU8bVAMIkyw0Kanr
X-Authority-Analysis: v=2.4 cv=VI5IDNPX c=1 sm=1 tr=0 ts=6b0ad601 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=gdHwamPtuzoUoDSM7zGmJg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=f3ww0dcz35mcA5LW8GUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI4MDA1MyBTYWx0ZWRfX1KBxmUf1w5yY
 gMq7icH0OeTIeYdgibzkn3/PNPdiJNyjLeBOaWp4+xizf53KipZBnPFE1SfktABvjfGQEG5HM6h
 RafrHhtM+redQ2T/5mon0xqqLebYKzY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-28_03,2026-11-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 impostorscore=0 phishscore=0 bulkscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611280053



On 11/28/2026 5:23 PM, Julius Bairaktaris wrote:
> On 11/25/2026 2:26 PM, Karthikeyan Periyasamy wrote:
>> Can you explain the test scenario ?
> 
> There is none: I have no ath12k hardware to test with.
> Found by an LLM review (Claude) of the code, comparing the decap path
> with ieee80211_amsdu_to_8023s(), which drops such a subframe.
> 
>> How the user trigger this issue ?
> 
> A station associated to an ath12k AP with Ethernet decap, without
> 4-address mode, sends a 3-address A-MSDU whose subframe header carries
> another host's MAC address as source. If the hardware writes that
> address into the decapped header, ath12k_dp_rx_h_undecap() sets
> RX_FLAG_8023, ieee80211_rx_8023() delivers the frame under it, and the
> bridge learns the other host on the Wi-Fi port (br_handle_frame_finish()),
> so traffic for that host goes to the station.
> 
This frame report as address mismatch error 
"HAL_REO_ENTR_RING_RXDMA_ECODE_AMSDU_MISMATCH_ERR" in the WBM error Rx 
data path. So no need this code change in the regular Rx data path.

-- 
Karthikeyan Periyasamy
--
கார்த்திகேயன் பெரியசாமி

