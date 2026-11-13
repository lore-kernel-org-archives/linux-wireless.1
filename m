Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794583392;
	b=aiiKvP5Eonh8cFnzfqv1Beax/sqgQeA2ztizaRTbxaIz/o9H1IezRxdNjd62Pi2l4KRY
	 Y9M/B76cDcOs7ixgAUq3ao2kK7OMkEM0NmiZTo63iAr/GF0Zc6UNhywivj08KhA3ON8Ba
	 thUt8P/q5TrAUlgHMQpgtAkuYEsURQwar7y8Tn44aGmiMdzgNTTGItqKZ6ru+ODU3WhBj
	 1DH8YQtQxxj3XewK22ezeZ7Lk6TQsJWpOdgb4Ge2rCiEbulZf2ZlqriObl80l+EmEe14s
	 xmEmRR+k5zK5eHyV+Rv7dchWW8K6ytRU/so+34KWlKMandEAQDXnD4IZpk/qTOXGgDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794583392;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=xrOmOi5IMTP1OBLd53RlrSVTXsL0uWCx99VscQ2eiUg=;
	b=rSVEkBqDxADsCP4Ag/e6hbXUfHGNh15QLI3xw2ttZjHaWUdbwm0kjL5Q/6+I/by2TWmj
	 y6FXeq1wS9YmMoencMv9cVzoW8hQv8zTa0x1TWP8D7YLPO1g2Fj9oewIwqsZc+3ANGgMq
	 Mrk2RBBRlUQgqSPPqv8PKQmI58iPAMBqGKE8YvbWAfPeY4tjW9491czGj8f57qWJ37BXP
	 OHLy78YSDEYBqDMYF//9X7lB+VAOKQtLlaYnrSLKumYqZxWewPFEO7mlOr9Sr4+TE9Vi1
	 TRsdpuMvPmUOBREyfxJzT2U4iM93XruCgIDwXdBpo1bLwhm7qG9TPHMwmcSgmDRssWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=a5ouvxL2;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="N/5WZFpi";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BE64606A884
	for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 15:23:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1BE64606A884
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=a5ouvxL2;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=N/5WZFpi
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADCJcWX242548
	for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 15:23:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xrOmOi5IMTP1OBLd53RlrSVTXsL0uWCx99VscQ2eiUg=; b=a5ouvxL2csSRdfoy
	rTSg13+0wZMPovl9NDZ5sUIk1y7/Mvnc2pFGRIstPl3xE8jk61cUsuFPWXPG1oma
	OA7ok6uz36moAF5Y5gmxDDUPb+htJz3MuZRtkvaaThqEKpG2Mkj4Kbaf1cD6Cch5
	Sm0RVW9MMkgKit1PWN0W7FVQ5tnkW373Ds2pRM0ckdn68JUfTwWazkXktx9fzYJY
	4gfD+6bc0HnIoYAEPpz4qoT3tGmWzv/OnaKNMN2uYjoiTn3lSOD0eOOfmQhyPcAS
	7vp+coSjqPosIvC7HaB+PH9b5Ke9NLm3LjvOxWvJMSlLtxMJK06RyJXdrVr/F6Z6
	cm9Xng==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwv37j3t5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 15:23:10 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ea71803effso10210755ad.3
        for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 07:23:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794583390; x=1795188190; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xrOmOi5IMTP1OBLd53RlrSVTXsL0uWCx99VscQ2eiUg=;
        b=N/5WZFpinMEB+SUxB807//dYKcXYPwnBjzXTwj3HoUZIqNdml/Sx3mVUtXLzqlgaIW
         J/jXh7B+nrLrMc1lCYCJNK3CUyWEfdG1MSGhGFWrJ9OIwmATpfFtLQZqFA2oInKM8SAp
         dtMXopMdzgu+x+OXHIWMl5Two1/kRnJSIJVJYCtC1CFxb0AxzVR5qlhUSVG2DnfGXeTO
         NmoEd8EUQo+fWt/eDyO1tbS0wHN1qgdVjJCLMfaPUu4XybtMEUcLltf1g5yuXWDE99sb
         MHCM/g1mBLIVm6iiigL0aq8/p9fDnetSn5wwBG5GCYylTF8A8bazg741LtOC0lZBmnSK
         XRLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794583390; x=1795188190;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xrOmOi5IMTP1OBLd53RlrSVTXsL0uWCx99VscQ2eiUg=;
        b=xZ8jL6IsIMvNkHDegkUbg4xHPtY+mKuOWxMSLEFwFwyf59+wvnlP3FoOO7XbqbB19q
         RcVVvpxSDQhY2h1dcBYjaVZxAnBi5RO8qoN8fpkgsSom7yhldmuhqm02rUd3F+ZREmBb
         TvTSDQrxcgL2EYNikWzU/Rjkh2hz4hmc42nMl5+iW3cH1AAYETItoImm8q2013lupOTw
         dz2sLQykO9sORyIKXIDuw3mWheIMBHhrPHKW+63T2+gI5TguQoc5Bh1eKcKLrUNhapDL
         S5UMRAe9yrn0BLNHfMJLcBezRI8qlCfdnUiGdK6QrHk0mpJhXYiABzKn/5V+gZvAyPbz
         Q9mg==
X-Gm-Message-State: APuU4Z/N84arDnqzf7TQJcrL9V4ReMwUw2Kj32meAaKap23PPRNeDETv
	f+jGU7UrTwOpLp4NV8jQHkaV2zJcbzkhr3LM0VshhDPokGXtbU29XpCcRpg0zsjz40CmgMsiQIE
	gyRdktBOS+8hWRymRgO2b1VLRW7fDtcORVCQm5pgEmq85hQRNhrRO/NFPrpkQcoR9iNEu3HOuDN
	Fj
X-Gm-Gg: AYBFou0ow3kLPCyn2xntCp6cZw/y5VUrqUpR1P3NNbTz2+3TDaKHXozjY30GV57S+5Q
	ueqss2xoqu334d6fNcmayK8S+T2zdr3yKbeDDUcaykjhYd+UCFL5L5Sx0PBqLLTukcWgdea2bmv
	eIwUnWDLFilIDS8PgtFH1EZj1Pt1hE5Usrdtfm7vGDHbQVh2kllxdy5rLzdSQyU9oLLOYvVzdCI
	rNdpSMiV8MYFMz+GhMmI63TH4oTQcFybhPR0yUEGvbWNqm+bFAEjucTvl13DuI31tKvr9pt9bNV
	jyXG1UsXVK/HPCZ4vpUgHWuVzD2PZyCO/aPo66kPHbOATEl5xzZihUWbYCDl7gPg3d4TpuXnVC0
	EjL2fVWFd9RCyMTrC9vLiNZv9AUHY0/ywTgIIXNrWjKRa/fYITrHaN1TKY+xFSC+xq9cu+fbcAg
	Jx7X3suiD3Q+G/ark69roJuDVZealfFQ2un5in4Z0mMH8ToQ/xDi7/vyrDlGxVqUBqtA==
X-Received: by 2002:a17:902:fd88:b0:2ed:21fb:e762 with SMTP id d9443c01a7336-2ee0dc933d2mr29590555ad.12.1794583389736;
        Fri, 13 Nov 2026 07:23:09 -0800 (PST)
X-Received: by 2002:a17:902:fd88:b0:2ed:21fb:e762 with SMTP id d9443c01a7336-2ee0dc933d2mr29590095ad.12.1794583389081;
        Fri, 13 Nov 2026 07:23:09 -0800 (PST)
Received: from [10.50.62.158] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ee0f8d70d3sm11869985ad.60.2026.11.13.07.23.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 07:23:08 -0800 (PST)
Message-ID: <05d0e51a-7189-4095-8243-fdc1c424e37b@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 20:53:05 +0530
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
Subject: Re: [PATCH wireless-next v4 01/21] wifi: nl80211: define Seamless
 Mobility Domain (SMD) device capability
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261106-smd-v4-0-62e39487f51a@oss.qualcomm.com>
 <20261106-smd-v4-1-62e39487f51a@oss.qualcomm.com>
 <7638714d73cda9a2538952f577be1a236ddee55f.camel@sipsolutions.net>
 <24917e113f203e6f6606dc5adefeefc4ebc27d9c.camel@sipsolutions.net>
Content-Language: en-US
From: Pooventhiran G <pooventhiran.g@oss.qualcomm.com>
In-Reply-To: <24917e113f203e6f6606dc5adefeefc4ebc27d9c.camel@sipsolutions.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA2MSBTYWx0ZWRfX0nad9MTivb8M
 6wGTLG5OlxQVtA3xcX3BmODwcvbMf8bFobcKg86UnBnpohvxgpVgoEdVRKGbsZZMqW5oSBuaK8a
 D2bIoqWamxD+6sPs2XYUWmWDPpdxYtw=
X-Proofpoint-ORIG-GUID: KDUtXTHhodLcY_XV2__qzFaRbniVGgxJ
X-Proofpoint-GUID: KDUtXTHhodLcY_XV2__qzFaRbniVGgxJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA2MSBTYWx0ZWRfXzUl3IxHlhprr
 djNgAkRKCaMiQ7v0lneshkG539TQuvNq6Dqid4NikTEgpYxE28RXhQwmJue+vnuOuzqIl96l42m
 fdl8geZKPOeWZS3Y1DdpGH94nO1kF+NGmnYh16YisZ6/K0ysA7wU5+oqC2y3Gnv92iIy64lF8Y/
 c81p/IpnK3HxwFyMJ+lVNEcyrXfkbjuLirGUDR2sIXhKEFzCr9IlJh7kT7RiK3jhvr01MzLGQd+
 /yaUS0Bcl14Agz6kLfHIBY0LL//Cc4W9JETE02SXpm2EDuWZnQ3NsJi0l0tK7MSR9bCYB7WIDt8
 CdetIqMTvJclnCzVYH6Jwbw3fgLJfXTgiw47WLwIZ33hfu1yqp/0gXbfbkMQvCie74LEJz2uaXQ
 2PRkE2xbWoepT+ATLNmwCt0h8nHSni8289O9tSSd3nA/7U0t7XBPCem8QzMdMkLno/q2OUzxvcC
 vgEYJpR0zcXIst+ZLZQ==
X-Authority-Analysis: v=2.4 cv=ZeeIpcVA c=1 sm=1 tr=0 ts=6af72b5e cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=C7ppcZlkJX4NIHrk3x4A:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_04,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 phishscore=0 impostorscore=0 bulkscore=0 suspectscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611130061



On 11/10/2026 07:56 pm, Johannes Berg wrote:
> On Tue, 2026-11-10 at 15:15 +0100, Johannes Berg wrote:
>>> + * @NL80211_ATTR_SMD_SUPPORT: Flag attribute to indicate SMD support. Used with
>>> + *	multiple commands to indicate appropriate SMD support (refer DOC).
>>
>> This (with the wiphy flag) is the wrong way to do this, we have extended
>> flags that don't need the double enum value and pass through to
>> userspace directly.

I changed the EXT_FEATURE flag to WIPHY_FLAG based on the comments in v2 and
NL80211_ATTR_MLO_SUPPORT implementation. I will change this back to
EXT_FEATURE flag to indicate driver support.

>>
>> But also, this does absolutely _nothing_, the only thing you do with it
>> is pass a completely ignored NL80211_ATTR_SMD_SUPPORT to START_AP ...
>> it's not even passed to the driver.
> 
> Actually it is, just ignored. I don't really see why we'd care at this
> point though.
> 

NL80211_ATTR_SMD_SUPPORT passed to ieee80211_start_ap is parsed into link_conf
and (will be) read by the driver in assign_vif_chanctx drv-op. ath12k
implementation needs this indication to instantiate vifs and workflows in both
the driver and firmware.

> johannes

