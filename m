Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794588347;
	b=VfP4E41qq/WH3hDQMjIMTf1yEsDnRVvGwdzYfSyxjvryrDE+SDOqYk0JRjA+RgsarMZ4
	 J50bhZcXXaLfiyWP+8vxUx5yaGs7T8PJIdncijfPEmrONHie6RGkU47syt0fgStujSmAe
	 k/wIDxRG7f/3aQZJjqxjqvCDjlNeuGQE7GaxnCMkIeW6fAxbH10JiLvInkhwQ+pmPdUHC
	 Y2CBjRUCa1JJG7+Yud78og8FveRbNdwXe+Xumf/vkwpf0sOBq+qWkAPohppzNOtZdomW4
	 2nNPVisDpaDP5iKeiCWV2DtGA5G+V1jMGViaa44WS0n8wC8XPUm6wky/rMc2iQPq5Yg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794588347;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=R+/O0E+zf0N3c+NrcyoG+TI06SvcltBVHoSInsjKEsQ=;
	b=nD4jCQ08SE7GDdv1ghR7dhUER5k8q6ZICvQeGIDvKiA/CyzwecaUgOY011oo4cF+07qV
	 2kmfO0S3IdIxF2dXKEoTQV7psJpcsgEK45xQ0G18NmiKc2Z52krZ9k+/Lz1CZEXfA8zgs
	 pe1JjixIlzs3V6i+ZEjpn78iTG3q8Ss81ejASikxgwBGS1a1H/3AQdo1rR/fFOFBgDQEH
	 OYihgpT04YtkFa+9QU4Llf/O7zeopshKnxWPo9lXcbsRpdawPKswy7GXCqj09PcfSHYBG
	 JmgFi6++3DUZuDOz4FaVQ3Vtms3rrNnNJTtuMfdChp0IpkW2qb7KiOwdXgN4aG1j+0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fL9qG4Jk;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PxbgW8KA;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0A87606E21C
	for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 16:45:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A0A87606E21C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fL9qG4Jk;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PxbgW8KA
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADFREsA1190178
	for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 16:45:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	R+/O0E+zf0N3c+NrcyoG+TI06SvcltBVHoSInsjKEsQ=; b=fL9qG4Jkr8RPUfio
	N+z7F8EnCeEt08B0Zh7Y4KoC4VKB4QPoFBUgOCJPTol4YUpoPecwvrGZh8VGSbUR
	sQK6kuJPouCGP4VizTc4TLXR0OPFu2CfzvGOClI3Gkblxsq9Om3KSqLqJ/cor5P7
	8BIQxW5j5Pzjc+mmwTMTQghBtwO+rcreiCzEVA5rrdx6Abh6xe90538tSYG6jrBy
	YG6xicaTOytooeOy//L+mVo+V9o5fx2d9YqUAkl84ddEPL8QvEaeF8PwNCxbLnl/
	fHWfFK13clU7RMaOdbVg6rN+Us2pmoXcI/E+YP6SBFu0isIBnBU4FGCdXaTOFwp0
	zvnNyw==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwqufk8nf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 16:45:45 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1b25d977b91so952144c88.1
        for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 08:45:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794588345; x=1795193145; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R+/O0E+zf0N3c+NrcyoG+TI06SvcltBVHoSInsjKEsQ=;
        b=PxbgW8KAe8rlvuLPNgY0MYidPJTXDKpOEuLjCqO1VkKmr/h2eYKYFlcNCWW7QhJcrU
         kwKDtH9E9pscokn0S3xjtFQWQpyrvyuQntFSe3STpCsPkZ+9MfJdzFZuJrqt5XqIj6Xg
         d+NHmkOxoBB4O1XjjyvAQEfKUIHnrKWlByQshPHVQ3bifO+A1tHhAtlAS8XKPycIBNng
         Qsdr7zWn642hZ5VeItiVyqO1s4CW5yhUZJN4VUzU6Qqc1GO3uLt6I7Zm7kGIwZDtE/oY
         5p9+FU5Vg3GHIuKhxSy95EUn/oW3aNvMQg1zmN9ItzA9tBEW3NMupv/EVyTlFRzKHX+l
         AfjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794588345; x=1795193145;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R+/O0E+zf0N3c+NrcyoG+TI06SvcltBVHoSInsjKEsQ=;
        b=uDpbHIGVqu3uO24zVM5uIxAazSXgTKA1iAb28Oh+ceMCET8ebh8GyYVwB85MxREooP
         XqeOmt8fAWcNCWM5YKdN8X0+RVFS0y/CpI7nq+5HINQ178+qNkdToapal8WDQ4hPchI5
         g6zRnzzyNnIL0rFdVxlmb6PU0kDis5g4NrC44yM9uSomJKq07syF4MPFS+xxAMkMJ8I7
         Ht57WIyyhX5fdKSTmBPyyMumtXeObcd6I0uhNsoYHFTWF1mKaLXbB8FFE3Bu7JgYBF+1
         jrbGRNFmAdtzurazdqrDkNKpFjcR2yAPgujoMW+ECh8Mk3/cawxjZyMxFynvJKj9yKpx
         44ew==
X-Gm-Message-State: APuU4Z9lPpEeSLwMBvSK/qasZyIYbeoEQ6xsqenaQUM7rVizdYTzFkHY
	LCtbErf6ndvaGSUbFP5xod7maVKcozjMReJz4lLIJRpOmCHvu/pzDfxZgU5IdBrkyUjj+9a4eFj
	UKmjjtRdLkzsZKay/0Dr1xkF77r1LfoYTq8ioAdh7zWjXZYjEuuX3E0b4UX8ufspVRG/6
X-Gm-Gg: AYBFou1tLBR5E8zXn0gIYXanJLzZuAz35nV3bTQqLCY/ifqfB6s6v+Pou4IEk+DTwPL
	DdcMDYBieB6TmciYNNYe2bPQNuKcue71MXvLbOD6tne39ASknN526amzD5AR+V6RpPdezDrh67k
	Ed0YymA1MHXey2rDi5fe1uIgVWrD7jEunqmqhUM0Ig3qSZPtN6KCcZCekYsh24FVOGyIs63Dvv0
	/ZTzHzJO46lwmHA1HXoTieQJb7+ssygzsEepXtkJkLGJPdfMsWxkeiwvFztu5WMgUDuau+ABZge
	Su51tKGXkNkUGvPGgMJIFFU0zTR8GXai2jVoFfRwuq8x020RgGLhENXRt2ZTJ99LhFp+qeCCxXy
	isbUhRVwGUZGFk/qiNhf5VjoQAAyTKm1ljU3NMUldCd7PiQ910lb/OF/tNOgDDCex9REcgXc3dW
	i+YmPWmTUzXuVu28dGM0uicFIAn8nLt9QplZ/BgMtEOdpedQEkgn+sWF1p1dIfeGEJ4g==
X-Received: by 2002:a05:7022:92a:b0:192:74cf:1db2 with SMTP id a92af1059eb24-1b5030e9a6emr4116462c88.11.1794588345149;
        Fri, 13 Nov 2026 08:45:45 -0800 (PST)
X-Received: by 2002:a05:7022:92a:b0:192:74cf:1db2 with SMTP id a92af1059eb24-1b5030e9a6emr4116424c88.11.1794588344528;
        Fri, 13 Nov 2026 08:45:44 -0800 (PST)
Received: from [10.50.62.158] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031b98e5sm8556045c88.14.2026.11.13.08.45.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 08:45:44 -0800 (PST)
Message-ID: <f1d28ac0-b0f4-49b6-adc7-0785ba88282e@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 22:15:41 +0530
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
Subject: Re: [PATCH wireless-next v4 05/21] wifi: nl80211: define interfaces
 for SMD BSS Transition context transfer
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261106-smd-v4-0-62e39487f51a@oss.qualcomm.com>
 <20261106-smd-v4-5-62e39487f51a@oss.qualcomm.com>
 <554491de8880420965217a37a7748d48622f1187.camel@sipsolutions.net>
Content-Language: en-US
From: Pooventhiran G <pooventhiran.g@oss.qualcomm.com>
In-Reply-To: <554491de8880420965217a37a7748d48622f1187.camel@sipsolutions.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: n5EwSYwz_EYpuMclzKDNZrZHtHQ1W2YQ
X-Proofpoint-ORIG-GUID: n5EwSYwz_EYpuMclzKDNZrZHtHQ1W2YQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA2NiBTYWx0ZWRfX3Y3z8Pt/yNsV
 VPU7BgDxfV66FYyco1fuMF8kB5YAmYGT2yOBdFf2x1jbYrWBihZZgMmAoY4RYSoKtXaQ8kwhdxH
 4BKQo2yRqsQ86Ra1zC9JZrHu98LDAlJjDOFDiauUGPFfRFPDCLjhwyLaj1q8TlWvwPza1SJtdh7
 ercKa5iDALFxFzPPhMT41hri1+mdid3KUjXhUBJ/9bFL9WklzcBAtcCG3ElweSDcjY9e/M2vdq0
 iXajd14qdY6gvicIoM5dxC0wOasKs/siyvH4WqMYwxaCJTSQKi0e4TSjrLBCJZgscUwXmxPvbNy
 MaJoqHBqMr85HuXXvfQQXTeDdWq1ysMzAvPtRdh3y76/z+rxpg0wIox8rLBb5iA4sXZnLXZ/Uxs
 QHqOhBD/RWnI1FaiJMXax2+VlTKisQcTv8JfVDob5k1oy70vk50yIsFX8fpblNK6DHXpEtbaoVE
 m0MElOK8HjKcReVus8w==
X-Authority-Analysis: v=2.4 cv=XZocX455 c=1 sm=1 tr=0 ts=6af73eb9 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=u-lSwiENm7VDL5mirAsA:9 a=QEXdDO2ut3YA:10 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA2NiBTYWx0ZWRfXz07FiQk89eVY
 8m/eh9dPotlg5+7jTJphuuuYr/WQ/CWO8bHf3OdKeOUbA8rc+NjWQTUc59gmMNvGk9esPSvB7Jx
 ptSHAp+l1pYiB+uaEsb3RiUS/qAINTk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_05,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 malwarescore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130066



On 11/11/2026 12:15 am, Johannes Berg wrote:
> On Fri, 2026-11-06 at 13:28 +0530, Pooventhiran G wrote:
>>
>> +/**
>> + * enum nl80211_smd_ctx_type - SMD Request Type values
> 
> This is more "ST request type" or something.
> 
> You're conflating "SMD" with "SMD transition" throughout, and the "BSS"
> in the subject isn't really supposed to be there
> 

I will change it to SMD Transition (and ST) and remove "BSS".

>> + * Used with %NL80211_ATTR_SMD_CTX_TYPE.
>> + *
>> + * @NL80211_SMD_CTX_TYPE_PREP: SMD BSS Transition (ST) Preparation.
> 
> (as here)
> 
>> + * @NL80211_SMD_CTX_TYPE_EXEC: ST Execution.
>> + * @NUM_SMD_CTX_TYPES: internal.
>> + * @NL80211_SMD_CTX_TYPE_MAX: Max type of ST context.
>> + */
>> +enum nl80211_smd_ctx_type {
>> +	NL80211_SMD_CTX_TYPE_PREP,
>> +	NL80211_SMD_CTX_TYPE_EXEC,
>> +
>> +	NUM_SMD_CTX_TYPES,
>> +	NL80211_SMD_CTX_TYPE_MAX = NUM_SMD_CTX_TYPES - 1,
>> +};
>> +
>> +/**
>> + * enum nl80211_smd_ctx_ba_param - SMD Block Ack Context attributes
>> + *
>> + * @__NL80211_SMD_CTX_BA_ATTR_INVALID: Invalid attribute.
>> + * @NL80211_SMD_CTX_BA_ATTR_BUFF_SIZE: Required (u16) BA buffer size.
>> + * @NL80211_SMD_CTX_BA_ATTR_POLICY: Required (u8) BA policy.
>> + * @NL80211_SMD_CTX_BA_ATTR_AMSDU_SUPPORT: Flag attribute to indicate
>> + *	AMSDU support.
>> + * @NL80211_SMD_CTX_BA_ATTR_TIMEOUT: Required (u16) Block Ack timeout.
>> + * @NL80211_SMD_CTX_BA_ATTR_EXT_NO_FRAG: Flag attribute to indicate
>> + *	fragmentation support.
>> + * @NL80211_SMD_CTX_BA_ATTR_EXT_FRAG_LEVEL: Required (u8) HE fragmentation
>> + *	level.
>> + * @NL80211_SMD_CTX_BA_ATTR_EXT_BUFF_SIZE: Required (u16) extended buffer size.
> 
> Same here as in the other patch - splitting the buffer size into two
> variables or attributes seems ridiculous.
> 

Sure.

>> + * @NL80211_SMD_CTX_DL_ATTR_VALID_TID_BITMAP: Optional (u8) TIDs included.
> 
> That doesn't really make sense, it just introduces a place where things
> can drift - the per TID nested values below already implicitly say which
> TIDs are valid.
> 

Ouch! Yes, it is not needed in the nl interface. It was originally added for
GET_SMD_CTX but that does not need it anymore too. I will clean this up.

>> +/**
>> + * enum nl80211_smd_ctx_ul - SMD Dynamic Context - UL direction
> 
> Right now I don't see a lot of value in splitting UL/DL attributes when
> they're basically mostly the same - we can probably unify that into one
> space and maybe have a few that are one direction or the other only?
> 

Sure, Johannes. I will combine these two into one namespace with separate
labels for those that differ in type.

> johannes

