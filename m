Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795140837;
	b=PKDrvqw5x2WE80ep6+bW7cUZJAHnYqM0SS+D6fYrWtGo7XgPqNHHl/H5mtp6AFLms2vs
	 DpYf3iYKwgKMs1qH9zmae3OEiY/YF+KtVszzbtmP1uMtF6w0rkqYoczJcQU7Eqlj89xKx
	 GpCoqEZxKNPsjUV3RDinszKIgdxETJQesAQnla4WsTPsP2XIm1A85yosZLbnvWGfHx1Dg
	 iAC1aR+t32tgFw3+vfk7Nz5K9ZlAeP0g+w30JoZHRPnoMwrvVyEZBmFR9cvW1MbuqdTA4
	 f3V9oeHpzTOsHCZURA3BXrHFbATGNvQ+u7oYvki4luNTxxoQDPXmzycv03Q7GenfbLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795140837;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=U9yc2VkkPuc/RNg0RZUbGHPvC6vp9oOQHo0RP401KUI=;
	b=zbN6qRnQF4m7XsI6LfwdsAUNavwu08hhXKh8VBo2qOaX1OUVmZIFxlRCL/hoJY4YjuDD
	 SW7kqsLDJfYLe41FcJqji/XF4bIhbJnpv663rXI/Q6nznh1u2Zwvn8coZ0T5QeSNb4TIi
	 i8atwJKvJrxuQP6hodb1VfwhzxbqrjH72Gp/qz3sZfdvEsh42RIqriRNLf2leILnRDPfN
	 VwW05VAnAzmJ0mntsCYxbJkW9Khuid9RgegFtk7HoruXXzACXi0hvPszLCXkMewzrsrdG
	 NhTW+kvMCUXBqPfgr8RKafrlMiAE0h1kP1m0l2HsM3tqyl9ptexL6ONB36zckpqgLIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MVBjjFEX;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fevDY3YL;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97B22606A330
	for <linux-wireless@vger.kernel.org>; Fri, 20 Nov 2026 02:13:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 97B22606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MVBjjFEX;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fevDY3YL
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AK0G8gV773130
	for <linux-wireless@vger.kernel.org>; Fri, 20 Nov 2026 02:13:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	U9yc2VkkPuc/RNg0RZUbGHPvC6vp9oOQHo0RP401KUI=; b=MVBjjFEXgtLpmWhH
	sXBbA9lgTsZ/Rnt9bxbCQe2G9xb6DSX9FtTmFMapfQqy91pdtMZBVjliNNr2AAM2
	sV6XHtts4sy5gYUMSfv7bVre2ZLNH37v5jFgqSKsC2YYYQA/eDjKqgZeePMtbRta
	aJCo/ORVZsHc2wr6rG7rDFVmfJP78Ow5Hvu1XjF3vtfLBEKTQselVOHxBDP4ZyEL
	V+5gb47AOea7MnmrGijFPmLAMASJu2xnoQr73APpWaBb6jW8Ah8COzgwRzXYPaBD
	48S08PjMzBrKdwkTqS561EYpSYVededMc0hqwHr+5z0+AECT+Ux0AUq749GZVVZq
	5vXEXw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1xx1c774-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Fri, 20 Nov 2026 02:13:55 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cdb91e288d7so366272a12.3
        for <linux-wireless@vger.kernel.org>; Thu, 19 Nov 2026 18:13:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795140834; x=1795745634; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=U9yc2VkkPuc/RNg0RZUbGHPvC6vp9oOQHo0RP401KUI=;
        b=fevDY3YLCZx/hny4n0qQoPMK/h1kgXPBR7Blqrr94AcUGaEzsN/UKUc7qFFgaB4yHt
         cFJlAjG8uzIR1/fmupPdeQ+2OYxzkvzk8IRuG5eByIFCiDTwxq82G49EzG88Lr1SLVpY
         +AefQqEnNwhQxPVJb4/qNcjXgrIa9kmsT0YJhr/RfAsn+qJResimPGpd6Cjtv5VoUhO9
         JpQmoMqjDLrd1AaemIrEXswXe3vq2Yemu8L97derGgsEazHSavvUm/2T26//5yFqbURE
         4+mYL7n8/SvhVNwB0pAJe3MXDlw22dhLZkyI6DwedSFAM6QE5tfQVEfjqdKzqPojI4pC
         Yqzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795140834; x=1795745634;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U9yc2VkkPuc/RNg0RZUbGHPvC6vp9oOQHo0RP401KUI=;
        b=BGWIYvB12vpttzMFIttzf8VBpKaxT4WzlqsEhDYSP7IfdcCreETRMZ/Ne8qJZOA1p6
         wOp6d41UTmrHtE6FUig1xEY8NTMobzRNInvElO+5gV+hdBGYIAq23SfN2BCE7Uia0S/g
         xZaCjALeaWGalHBpZ/P7IYLnboQokhAnJ1EC45//cTbsVBX5j8VBOkmRp4crV1iXPVMD
         Jy7iiNqmRDXT1PQbnIIzR5yY88KiEQxH6aLndyFdpqQBEjuRPz62KBTTTt3O22PLQp0M
         HpaPD1PNYS9R0oHWk3/6i8tWARQMsyf1txVQHqYPldfJlH2CtLMMviQZMhnqHjSJoOA1
         4h5A==
X-Forwarded-Encrypted: i=1; AL+hErEbOYlIqKUEtt9+y5pNemic2xdC8dXqxOd47owcNg0jUTnmdu2GZ3vuQjiTZWS0XT7zEQFLuBzQLTnSM/C/RA==@vger.kernel.org
X-Gm-Message-State: APuU4Z8SCR6rvz9ji4DELKLuSRJmvhuoN0wUT5m/FUfJYRMyMsqpTEjA
	PLq5oGSmLe18oGsSDLlleCkLx1Qdn/rAyVLv1QPa4twxYWPlOjGP28sNDL2Cn/VPQ3pgNV1g9d5
	FKT5zjFHB+UifAhMNlPhTTToOivZz8focS/PuPZGzFuxmG5N4rLk/AkBCV8y7UwIIu25gkEtIXE
	FFjunz
X-Gm-Gg: AZFdTZcUqswq79EnoIcJtF1T4hpzgrHMyCFzojJVpwW8DU0KjN0pGQ2xB+Mk9e8FoNp
	NlFFp/dtITXGgjWzdVo9hfCwYoFW6YmHbLI5WUa3laosDKHiz63xB6xiqQ9RXZn7IihhQZyl7ds
	YOfpWoqb2mE5zpOgrcXQQ/ifOatsCnr4I01yrNDFp8usQrq6s+MLX0RpDr77dV/7ureboGX9ys5
	CRsJ7ZpSV8/1O8O1o42luNa6g0V0p97TcKKY3bPeqc6GDaC4zQX8bsot82DU51RfaAFx6UOePur
	1Ai1b4NP5F0K2FFVeakSyJfppBAIfJrthpTdu8ebJBZJOHnaPlBBIH1rVDNykVuueirKU8mtpQj
	5iwpEoIWBVLu2otJDrjSgavX1MWDQc1oZaxiXCHdCTmRqsxjJWv8L0I3wuLZqJGpu3i3BltgBTY
	UqaawnnDUniBj0zaZlZ7seB7t21vpZUuVTlTBhVwNsPgFd
X-Received: by 2002:a17:90b:4d10:b0:3ac:9669:846b with SMTP id 98e67ed59e1d1-3b41c852826mr1394771a91.9.1795140834180;
        Thu, 19 Nov 2026 18:13:54 -0800 (PST)
X-Received: by 2002:a17:90b:4d10:b0:3ac:9669:846b with SMTP id 98e67ed59e1d1-3b41c852826mr1394743a91.9.1795140833690;
        Thu, 19 Nov 2026 18:13:53 -0800 (PST)
Received: from [10.133.33.33] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b420e1307csm893758a91.7.2026.11.19.18.13.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Nov 2026 18:13:53 -0800 (PST)
Message-ID: <46ad0af4-b719-48c3-b653-7367c5b2a136@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 10:13:50 +0800
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
Subject: Re: [PATCH ath-current v3] wifi: ath12k: parse the nested DBS/SBS
 capability TLV
To: Jonathan Wolf <wolf@pi0.com>, ath12k@lists.infradead.org
Cc: jjohnson@kernel.org, vasanthakumar.thiagarajan@oss.qualcomm.com,
        linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261119191717.215161-1-wolf@pi0.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261119191717.215161-1-wolf@pi0.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=PcBqFShd c=1 sm=1 tr=0 ts=6afface3 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=apydtGMFAAAA:8 a=EUspDBNiAAAA:8 a=ZrLfHWaURdO93HeJtlEA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22 a=_GdCGhGMWlTvChih0T78:22
X-Proofpoint-ORIG-GUID: RZWtWbhoVdyPYYG2RYmKpnTex84SZJ3n
X-Proofpoint-GUID: RZWtWbhoVdyPYYG2RYmKpnTex84SZJ3n
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDAwOCBTYWx0ZWRfX7BEyL6MgAF09
 ZsKwsA4XVJb4FB9eBQYv8D3bCUrwYeJyWLqLqaK/xL3RbBpNIafmqHKnMbQo/za/j3pigfjQ7un
 ykj4RDUG6Zvp8IQr7NyX/VdbB1a94gi58dH51ulmEX3AjzKQMbjjjoVfzQog7kb+YlOzYDWVHcm
 KB7atbuzmLXevYcnEQDybr5y2iA0Zg/27Em8TX5EAD/5N3F5B2tGpVjE7zxPXYC1L7GPjWKSbKj
 bQ5zHSjJJ/J3rfiDEV/mVldgvenw7soFfjmRrfvDi17tkIHGl2s0w36SD9Bns1q9kLiVQ3UiOLN
 G0PtcAl29qV0DXVsaevwQnifkdDDeQ/jVU+NZoqtvMf76rYETMF60Qd+dWkN/paGcxZHsF/Q1qD
 tjAMwDGaBFhm6GxsCNRdkUOfn0+M54/P0ku43kyuqEex2ZZpxCQOrAuFfIsCw83bCPHfb90xiZj
 OoX5CBTX2i/505bgIJw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDAwOCBTYWx0ZWRfX9hlZddPo5CbZ
 Y9okCKBceT8VCHJ5OAkK/kPV9y4mjGkY93YsUt28obpAwBKiIuq6i6gYuO8lM79DgyxrEXQn1M0
 3JwIBryrEzuO3KfREwx1on+7Z4oKzms=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_01,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 bulkscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200008



On 11/20/2026 3:17 AM, Jonathan Wolf wrote:
> The DBS/SBS capability in WMI_SERVICE_READY_EXT2_EVENTID is inside a
> WMI_TAG_ARRAY_STRUCT. The array payload starts with the inner TLV
> header. Casting that pointer to struct ath12k_wmi_dbs_or_sbs_cap_params
> makes ath12k read hw_mode_id as sbs_lower_band_end_freq.
> 
> On WCN7850 with hardware mode 5 and a 5900 MHz cutoff, this gives an
> SBS frequency range of 4900-5 MHz. The driver can then map the 5 GHz
> and 6 GHz links to the same MAC and request deactivation of one link.
> 
> Use ath12k_wmi_tlv_iter() to reach the capability payload. Check the
> tag and minimum payload length before converting the cutoff to CPU byte
> order. Clear the cached cutoff before parsing so an empty array leaves
> it at zero.
> 
> Fixes: 241d130f1419 ("wifi: ath12k: parse and save sbs_lower_band_end_freq from WMI_SERVICE_READY_EXT2_EVENTID event")
> Signed-off-by: Jonathan Wolf <wolf@pi0.com>
Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
