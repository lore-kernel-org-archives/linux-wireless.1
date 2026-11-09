Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794260462;
	b=1Jf8GzxN9e5v2z4KSTFRAh/+uvIZXgnceDQTmNn0Pf1m9EomHuySjRR5JveT9Qa99obO
	 GSfNl9Ixl5g1ZGo4MZV4LACEtjpRA7+V5LX7XQo/ENZGaaLfpKLtAP7Xnb6r+KVBKjSLU
	 Obv6bfmzcq1Wuk/mkwA93edqFvvdFrIvOc3CfsAKYRzX3tuoeYXt6fnd3rBDh96J6D3vC
	 3TUFEcAn+WQ7KjOdc16wuPC3AnCGeDrFSP4Ba2PjRvmiva9zx+mX9iUBrh72E8zEDfgjC
	 KCz3MfHszyrAlGE7GVXfSpC9H8Z1kZcNWW3XI6rMqjs/5BQOYoxxzNSWfbG2Ut9twYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794260462;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 In-Reply-To:References:Subject:Message-Id:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Mailer:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=f4mRcM/+qi2XZzFnwy9p7mpo/dc0cbBpke6kcb+FN80=;
	b=ntPTHcdGp9+PtjdJBAor+vIabZRDqooj5lYzJkMJcwiaWwL6A6E/q8ooUAo6kVa0aj1o
	 i1v87mBg0HAESDQZAI8Me/Q079/v4Iu5LcY6fJHCrwkTOehCC0gWc4LF6ZdCbeWS5LeFx
	 CZX23lQkH19XVqhjAZKteRx/0lotov/Y9vJW+vGr+T15aRpcSrBiagOvCdxv8tUf89PWS
	 ZpO7NgZjneHcsAT9I/ganWCiP2puBAMvKCyeWN2MUArwsDQM768vZXAO7gkA0SaxiDnF8
	 o3Szy6q425n+RuCzHI4hjzn/1sK/XiTPDR5QBoD8HGKoYqO6DOL3VTCJyIl9nx8QAWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oj8jMXMH;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=S+BSYXpz;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A13E606A332
	for <linux-wireless@vger.kernel.org>; Mon,  9 Nov 2026 21:41:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1A13E606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oj8jMXMH;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=S+BSYXpz
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9LA5dV870394
	for <linux-wireless@vger.kernel.org>; Mon, 9 Nov 2026 21:41:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	f4mRcM/+qi2XZzFnwy9p7mpo/dc0cbBpke6kcb+FN80=; b=oj8jMXMHdDyXx0J6
	Ij9Jxh437huewYEuL2L43gSDEvInLikDx63uTn4LjmUCgQeM3QIeQpCdJdpWBunO
	yRg4xoTNew49haIlrReKrss5HJqOC5V2Ht03w83tJ7Jt6a98QrDETWwWuk5BFC6b
	hzcf+MnwsegeNphqnN1LsN0Gu/1quCnrortxm6FqYmlqMA/Zh0QR459JvP//uqKI
	RzlW+1E4Ne6R9Q0s08w84LOKV6bEQ2f8PMW7/UKOiOcgLtTol6i5Q2j/fTWxD9fO
	UX9q5wdpwA6RksaCa7U4yN5wDBxnL8vbPV4RmrAer2hGRY9Zkfft0Zq6HmrUsRpK
	1587lg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hua58avus-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Mon, 09 Nov 2026 21:40:59 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-30c0d568830so3476735eec.1
        for <linux-wireless@vger.kernel.org>; Mon, 09 Nov 2026 13:40:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794260459; x=1794865259; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f4mRcM/+qi2XZzFnwy9p7mpo/dc0cbBpke6kcb+FN80=;
        b=S+BSYXpzjcoDQLHD1Daup2gxwOJFOfjkOSyOLaIb+1o7f58uaudVCf5TDMTmLQGUSE
         kCUzyfE2A3sZC3AgSfjQyhZwPTcwOkLUrV9uzz0VsToiEU6mXt4ZaxIbetbphPlHB1iS
         nFF/JllC37DGoppDkQxQm9gQkatJlf28maY6DOgULzUBJP95jc1YQT5+qRXoy22Glj66
         6xFsQ5FPKM6h9h0MKMVmE0a4rW5QQktF0sU+XU6nPnyTS8Zvlz/QKEZrqpLuWef8scIJ
         i1D2dQ9D6jf4PN6B7VyPu6i+UfEKfaB0fN0mYN9UFHIYehCpOQFajUTvB50LENhsFfbz
         h/HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794260459; x=1794865259;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f4mRcM/+qi2XZzFnwy9p7mpo/dc0cbBpke6kcb+FN80=;
        b=yvvJj8TLlyVCkXXr4eZep0xoBkPOpi6dnVsZc2X+pPwuMS43JKUhBVboNEGu9D4OHA
         N+v7RKGX9DLglECnTg1vaULJe940R1NsYXCuxqaf3fUTNBrW+xgbrGg3U4s7FuNQbF4i
         N87jHoOT9tCBcPPtbGLBHyIQyCKGJG1Km+Vyg56ozPT/85Y6YhaZgMoXEpyUPSz9TxrQ
         1Xcsxe0YNVjzhykXGYWUl2z6GWqbdkqy+sAPelZaSYcpgN6aC3YUhg3jSUlurDCqFkLP
         LDs1g34sKVomGMgh05Ba1qy+IcerLFGlgEGFQz9l4/yX1sxBbdaqxGsE8eLKxfy1BW2V
         2doA==
X-Forwarded-Encrypted: i=1; AL+hErFKGeVQiwuh6Juc8foLrTclIAkYHedhP3aIdZR/N0Q+7gdRdDAjXRYpJhav/xBkOzdoWdGy9vjG7RnAVtifaw==@vger.kernel.org
X-Gm-Message-State: APuU4Z8CAdma6ZxO0qDBpmi0mV8TCjq2F13sc5frQFWLAnBjLNIkiil/
	cj9IFYU2ie/TXTt4Tzsfi7fQiGpGTeF21N51PV+ob6P+IAylEF0rhsvizXbGEjyKagk97OrQRh2
	p9hn0GeXEzODyt1li57jAS3F9azXsw0DYxVubuBkUUplegy30BtKmiwsYXdalQSf3rgLikA==
X-Gm-Gg: AYBFou1yi1+urBmCGWFAR2BjWzlheMKrfIv2Gudqtl7C629SWParH8cMr3Mg5aQRMyg
	Dbp3fTjUIPlZTuEmCS6XeRTv6YX8nqyDYoBzLQEkptf4PKPbYDMaOMRHI353+9MQJ3wOp1zOQ+6
	bvpr2LycbSPhqWaSAq3uqvmE9L0B3Edb3ejHFhA4aPfWPX6WwoNXDmtoV8yoyPNZ5lEZcc5rhWk
	lKVOkIMPNOyzkSGceZt7o2oELvYeyrKH3jjEM9MSwkBMXzNbrBrb9RgFC0rOFc7wtRfwHmvFiTm
	aAZ+CXadPx3RgLxZwtrNsn1MTG6/9aQccWv/84nNQ/bILh7SIbDd6KD6GAqAzxymeWjwHbE0T/0
	olFOVZmwEkxfabE0YvRXR7y7eDQJvRE5IxLPrZjYqi3OlUCdowlBJ9GegjFZlEuNKIqa22xk9wr
	lmDl7zfKe4Hy5XklMeAVtO1ti6XLc=
X-Received: by 2002:a05:693c:6384:10b0:372:32a1:b384 with SMTP id 5a478bee46e88-3751fe32260mr745045eec.33.1794260458396;
        Mon, 09 Nov 2026 13:40:58 -0800 (PST)
X-Received: by 2002:a05:693c:6384:10b0:372:32a1:b384 with SMTP id 5a478bee46e88-3751fe32260mr744999eec.33.1794260457688;
        Mon, 09 Nov 2026 13:40:57 -0800 (PST)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520512ec1sm989985eec.12.2026.11.09.13.40.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 13:40:56 -0800 (PST)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: jjohnson@kernel.org, Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org
In-Reply-To: <20261030090906.298234-1-jtornosm@redhat.com>
References: <20261030090906.298234-1-jtornosm@redhat.com>
Subject: Re: [PATCH] wifi: ath12k: fix wrong register read for RU start
 index of 80_3 segment
Message-Id: <179426045625.3811579.10660215408027354985.b4-ty@b4>
Date: Mon, 09 Nov 2026 13:40:56 -0800
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA4NiBTYWx0ZWRfX0nD59nfScy1O
 FXdGqcdwu6cywWF/gfNSsal2t2r1obZsObeozPQSAiEKZw+j3qnno31/xtFNiOL4tDhyk0wyfNJ
 YOkBUrN9/YsEjywxCIlE41jjRD6E5upr/ekRK0FzVGRgZsMK9PGvee3Pcblo21vqZn48JhDDtsL
 SzcMroh/GWLH8++iivrQ2UOZV9Rsi7xYjbbbarG/Q3rpFDxuiXlHJ6N4gOk0z5ZE096lLSHf0/J
 bEnx/+zPY8TZDfzq6AdOK8XedSbSFWhu1WbT1TsP7u+LlIHeUMV4EOoRZwMpF5o4gKTzIsSwGCL
 mhT7fKNktW9Fo7r9U3p6nfOr8viKMZ4pk4tNu31Cw4DmDISh792eVbBugpANdSmYhziLpnegYuU
 6zStPF8i+lKE2LWmMGXs9cMQ1bbn3Lt5fHuYpzAQzKLfNFwlMPcSVWvxOYr6wPWDT4lSpcgpjVe
 83RQ0qjA5VpIdRw3oPQ==
X-Proofpoint-ORIG-GUID: FluCYaRKGOuj9qcuRFLzb9lyGEKjUkyK
X-Proofpoint-GUID: FluCYaRKGOuj9qcuRFLzb9lyGEKjUkyK
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA4NiBTYWx0ZWRfX/zc58L8r461X
 meJNLNXD/yHY1xM9JOlSjHr8kLBH1idVK4YokosOoNQfYf+RvA8hs3ChC925SZEH9TnoEq2/8Nu
 00KUu4Vrg/g8bIa5JhyuFeNSFsMHQ6Q=
X-Authority-Analysis: v=2.4 cv=C9V8WgP+ c=1 sm=1 tr=0 ts=6af23deb cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=LQZMuA99dPo4G15aSkQA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_07,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 bulkscore=0 suspectscore=0 adultscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090086


On Fri, 30 Oct 2026 10:09:06 +0100, Jose Ignacio Tornos Martinez wrote:
> The RU start index for the fourth 80 MHz segment (80_3) is read from
> rx_usr_info->info2 instead of rx_usr_info->info3. The bitmask used
> (HAL_RX_USR_INFO3_RU_START_IDX_80_3) is correct for info3, so applying
> it to info2 extracts garbage bits, producing an out-of-range shift
> exponent that triggers a UBSAN splat:
> 
>   UBSAN: shift-out-of-bounds in drivers/net/wireless/ath/ath12k/wifi7/dp_mon.c:302:22
>   shift exponent 284 is too large for 64-bit type 'long long unsigned int'
>   Call Trace:
>    ath12k_wifi7_dp_mon_hal_rx_parse_user_info.cold+0x3a/0xef7 [ath12k_wifi7]
>    ath12k_wifi7_dp_mon_rx_parse_status_tlv+0x621/0x990 [ath12k_wifi7]
>    ath12k_wifi7_dp_mon_parse_rx_dest+0xa9/0x2b0 [ath12k_wifi7]
>    ath12k_wifi7_dp_mon_srng_process+0x34f/0x560 [ath12k_wifi7]
>    ath12k_wifi7_dp_mon_process_ring+0x205/0x270 [ath12k_wifi7]
>    ath12k_wifi7_dp_service_srng+0x1b4/0x5e0 [ath12k_wifi7]
>    ath12k_pci_ext_grp_napi_poll+0x43/0x100 [ath12k]
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: fix wrong register read for RU start index of 80_3 segment
      commit: e49c1be5860334976e485777b97991aae9b4e8c7

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>

