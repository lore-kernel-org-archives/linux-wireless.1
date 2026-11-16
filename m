Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794826219;
	b=NwWG6FmJVn5AZ/Kz1VLm01rMtopHIQhhxWeqoMe1gYhmtBFi3JQIsKiBDGY+qdDZr4uO
	 jy07wi4k0qHMEgFDQGKhOxSRgrvegVO+cx/Jk8uK2E1dIio/IIiQ0ntqvWlemcHWJH4Pd
	 U0eHpioGBeGnzsv5rACz20e4Z8xdaEKAUIetAoqwos9lN2s4mMO5CRMn3PHet+gLmTa4G
	 WbvtpNYE0RfcbwPfs0KD+vqEglSWxnosDb9ybtice2kQ6udNEELfPrXcWQKXY6oJjDJfk
	 v5qVpneTv2qPUeu7Bxh09N3z4nxi2P/Wrlld4l1D/EsYJXw+fCnlKsJQ3gV8AG4xVWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794826219;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=DAZVfLcGYYhklRO/MWrxZTQNHhdEa+18VRwahyI2Cms=;
	b=bXSs3isZBliRTv/veoVpwRlw6bvLnfDTX0J9Nw1LK5/Nwiv5Fgru89ZJSmx7XL6GV35k
	 MuhkIyEFCtgujtEZfLw9hUTDg6DySnGeTODnMHRsRfCDL58UsHB5Citof2wNi4rR8CGAG
	 VS6F1D2FijyljkIMDo1Y6gMfFUmpnRqDSYmTvOxWtfDsh+5WuNZjaE8/6oKGUXLI/zt3m
	 ej8MLgjjwFj1GDV5Cr6yjeKbSXSeFBMiSOz8K2wHQio3T/IbJ/ND2yf9ojCqsEklqOXrn
	 P8oB/3SII2OvyNBKwYxGKy07NkiO7rCWF9iungY3x0FOYxuhPXcBj9DjF/gNlwwHSXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=N5LVk2uz;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LgTEt8Md;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84F19606A323
	for <linux-wireless@vger.kernel.org>; Mon, 16 Nov 2026 10:50:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 84F19606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=N5LVk2uz;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LgTEt8Md
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AG7enlF1109776
	for <linux-wireless@vger.kernel.org>; Mon, 16 Nov 2026 10:50:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DAZVfLcGYYhklRO/MWrxZTQNHhdEa+18VRwahyI2Cms=; b=N5LVk2uzs5TMt0XL
	BEyIvhlxFrNUTQ95NY6y3XydGGzyP77uqmLpMPFhU9iCPRoIkhK4mtrPC8Mc3B0r
	woelA56tGDdtO76IC0kWnen0mBM2m/Igc5sels4JK/vIrhKYkV1dUi5pPVM4o2K/
	FUEvs8Yh/m2To38j5uW0row62ShESxRvGhO+6ju9xKVV5vBa/JePgKoS4nsPU0MX
	1dX9aaFyb0xPwuFdfwJQ67re9PC9YxQXPKWPQsw9YwHeb4od4Ip55z6oyvI7tMDz
	SDcnIyr/zXbNm/93rB+TFcKeBZdgbeMfcX10Ca8TmH2IJ8uvPjdmStRPcPmg/vYq
	5jYlTA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hyrmc1s91-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Mon, 16 Nov 2026 10:50:18 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3ae6fda7a00so3132279a91.2
        for <linux-wireless@vger.kernel.org>; Mon, 16 Nov 2026 02:50:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794826218; x=1795431018; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DAZVfLcGYYhklRO/MWrxZTQNHhdEa+18VRwahyI2Cms=;
        b=LgTEt8Md1Gp1CGJYeR6IvA7tqzw3TBmObWRAqdh8kmG9qxEzCdQE6rknfrC62PSpUN
         IJD8tTGiRX/PgQiQ0+0YR+T3jszON+G/dd1eu3gkkvqWYOjmNV1DBP/hpwrerI7ytpVR
         pOC1sDPP2j8lD9R/diZ95F5oq4LykS338Zjbfp6/saW+5k/MJRHMoGLz2N+3I6MaB3/i
         QXryHQ5nrBQzQ1Limcx+V6tURCZT0eEcUgXVzzJJ4CUu00HlBDVmqBX4jRWBoCGwlAh/
         QRQFZK7ldoqcz24PP7e5057vQbfVaa6Yp9DMsEINK418KG316WBiA9qi63NYuMmnxrKD
         W6+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794826218; x=1795431018;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DAZVfLcGYYhklRO/MWrxZTQNHhdEa+18VRwahyI2Cms=;
        b=H0mFoMdM3ZOD2lhbKaOJfa05sp7HRYBBWJvthnM1Jz0sptBaxGD3q1AgNnevUkAc8k
         79YCaOVg6z2JRmSz/B5Wgmg3fIfC9SWwbI7zr9immllAKkwg+jW4HaYFUf2Jv8zMnb4Z
         j0/IpMf627S/lXgqDpPs0z/BQ3VuUnjHq+4hplE7eW0M2FO8oi5BpyLtDo+8fYf7RsEu
         C8y5f8+/QNoyGWl3WycRtH/suvH7vJP70Dg2XmNIOJQMM3xjCqT1911FlIFdbYit+ZyM
         C07Cb4DTTY6d17vRuoaavTmIQnypGzHoY50wgCJOdLxxpN6a1Y4BKCCIAGo+JSQVAJmU
         81Ww==
X-Gm-Message-State: APuU4Z+C5ufF7sTyytsrMqIXCGLRcR2Bfm13yZOEPPmF9oSl7UKhnqFT
	n2RYCfpQ1zCZ8/dfTBtsn0ywER4Wd4km1GTJ2BFnzSRi4er0xv3yqetXU9XGPqf+lf6E5Ascci/
	a3yqC7brRogU8LEUiopEGCkN89+TIt/aRbskcCiND1ykHo3IZ2VdmO1Rn7NvzEnI+oXy2
X-Gm-Gg: AZFdTZfGzRKe5RsEzxojlHCo9dIDHkbYB2d8Z8KktUMf+93mFeiUqqWupL5vgLnkc6b
	l8eouDx6wviOIRoy/EACdki20pwGcmb/XJWtb2uoXQIHk02SCJyaPG2mddGW2gMOfh9H1ArJ5Nz
	4ZPReGyjK0WhGo7KSk1s2ZFNdwHj8eYUUTrCJWST7aGbEeR1bSPXgoJhjiS7G5VfuV2LIX43Wte
	Edwp40Ir/+RxLKJipBZcEY5rWvyVrSHqlO50l4IwhlyPYyhDwBHUDy+S3Qlh23ONmjrbKma1CBx
	L0k2RCHDSTs5/dg3UDl73J13pEaw0zOoDaEGPc+EoTTzE9UJMfOvA9PQHfXIaTLW+DDImXxH38C
	nUlRBDeh6PB4NAYRi1QIK+jB0MP1XXcrBvL+9vXWARs1tL3umIcmBNtmCyvNj4i/V/ef4dhun39
	qzvvmvuxrQCMJTqsmf5Z7EJ0sSV+dTg8jqdZFWvSU6mPQBP/6y1l0sFndIa0pmgWyP
X-Received: by 2002:a17:90b:4b0a:b0:3ac:17c:6e89 with SMTP id 98e67ed59e1d1-3b1b09fa36bmr9142279a91.19.1794826218072;
        Mon, 16 Nov 2026 02:50:18 -0800 (PST)
X-Received: by 2002:a17:90b:4b0a:b0:3ac:17c:6e89 with SMTP id 98e67ed59e1d1-3b1b09fa36bmr9142268a91.19.1794826217536;
        Mon, 16 Nov 2026 02:50:17 -0800 (PST)
Received: from [10.50.36.90] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1aeb17853sm16351460a91.5.2026.11.16.02.50.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 02:50:17 -0800 (PST)
Message-ID: <099e07e4-7861-41e5-a688-a43f1f57918f@oss.qualcomm.com>
Date: Mon, 16 Nov 2026 16:20:14 +0530
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
Subject: Re: [PATCH wireless-next v4 16/21] wifi: mac80211: send BlockAck
 policy in AMPDU action
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261106-smd-v4-0-62e39487f51a@oss.qualcomm.com>
 <20261106-smd-v4-16-62e39487f51a@oss.qualcomm.com>
 <dacf9b17cee00430301403e64d8353348a747d46.camel@sipsolutions.net>
Content-Language: en-US
From: Pooventhiran G <pooventhiran.g@oss.qualcomm.com>
In-Reply-To: <dacf9b17cee00430301403e64d8353348a747d46.camel@sipsolutions.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA0MiBTYWx0ZWRfX6WppkImVlDhu
 3NTYWECU+KXQ2A2AlfmZXM5yVvmaVRC1qK2+NOWNIeB5ecpElo//1EVXGAsBXJU4SvZ72u/5WG0
 FAV9Dt6lvbzVb0dwy5/E2ji4vPAFl9s=
X-Authority-Analysis: v=2.4 cv=C9N8WgP+ c=1 sm=1 tr=0 ts=6afadfea cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=nEXYo2GfNLYU3GksVNYA:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: KEibpusEvK8NM1QikvI2sJ8cXcbs0fdB
X-Proofpoint-GUID: KEibpusEvK8NM1QikvI2sJ8cXcbs0fdB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA0MiBTYWx0ZWRfXxCWbPXGSdt1O
 RBkOJ7hWf8hK/ZR4py5yFv6eJVWK7F9aprboJlOsuTolWI+P6SdKzQkqRgwpGY9QHskVajqnbnv
 j5eh8JUVC1pepDlUfP8v+cUR4LlF99nQ4dXq6JOckssCYvyJFzDqqYfjqbR88N4IrTEY6qSeCx3
 gTL7Gg5sg1hHtCWPFxIA4wBQpFeyXZor+CgqJmLvvcNkOLrUS6gOuThadCZpxkNa3xYr98ySdzV
 NMkrc6TrO+KSgbMQm8t2Hr2dx7Dotx7z6f+aY+PY/WLb/Sylxi9DW5+r/MB0pdDbcMftjNfiRCU
 AueV64Sh/Onl/kEJCf/70a9v+FpOJjP6/vik0vAO25oI7/ulta9lrLU6wwV3hyYmewOiLuHqpeT
 kRv8aQbJ5cd4wP9+Jm3rJxZelLYHImcrfwInFD5IXLcO6GLsyL9NtDwT75u6qzjR6LVB1f9w+tm
 DOwGWqIiA0LR4z/u8CA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1015 spamscore=0 adultscore=0 bulkscore=0 phishscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611160042



On 11/11/2026 02:13 am, Johannes Berg wrote:
> On Fri, 2026-11-06 at 13:28 +0530, Pooventhiran G wrote:
>> While sending AMPDU action hints to drivers, mac80211 does not include
>> the BlockAck policy extracted from ADDBA frames. Drivers may require the
>> complete set of BlockAck negotiation parameters for certain use cases,
>> such as SMD BSS Transition, where the complete BlockAck context needs to
>> be transported as part of the transition.
>>
>> Include the BlockAck policy as well in AMPDU action so that drivers have
>> the required information about the negotiation. Since the policy is
>> extracted from the received ADDBA Request, it is valid only for
>> IEEE80211_AMPDU_RX_START.
> 
> This seems a bit strange. Doesn't not knowing basically mean we don't
> really even support one of them (delayed BA)? We also don't (cannot)
> advertised delayed BA support.
> 
> Pushing a bit to the driver from mac80211 just to have the driver push
> it back to mac80211 also seems odd?
> 

True, since delayed BA is not supported, I will drop this patch from the series.

> johannes

