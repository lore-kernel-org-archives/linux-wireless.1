Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795011540;
	b=P6ggh+wfV7CTTv9+CoinWd62w2ykc3mcXvn+H8FCskf2KCtPG+Y6aSP8wNaF3Cy8MDSb
	 tJHfzWbqQMzPrVXgf9FvPEKNh7d1rZt+V0oWSVf1EZspjPBPH6+3kIhu4tmonSl008xuF
	 RF3jP5iXQIvRevp38b/OVQ1gGm6HkaWkmsZTsfOaQURmGDKadUNepqU6oAIPGK6tryffa
	 MNOWB2U+i8RpNiTuOsTgurlD428HTQ9i87Xtqv+yWDzqzyNuS5OZkYaWCieHJCd5BSFJZ
	 EiGDvHrTsounpCAAwkUtKMI1UPbUg1qUS+GeGGGQ0idxNaFIjs57lGd9lrz81qjhoOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795011540;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=RQTRlWlNPA7govfbrjAsnCPFLMb47f+N5ey70lGllSA=;
	b=ND8dezKXxRGVMpUiAoy2hRq1HpDTLDff/CDm+gZ7UkTVCVDlPjJSwPxLq/wzkNpBOyps
	 iWMgrwJouHtAztOBlM/GEobPe0yGAeuqmW++S8W6OrlGpfCOJSfyTiusQrSxXHf7MpXsO
	 V2iIxqCHVux1f9vY5cRvOCAmZymJB6Of6VJU75pcVXvMlEt8Hjmsff0rhb8FFztrEA7OV
	 +q4WSdyL/0gZTMxJUfcMnNomk9F16xMXBRBWRQdAGupLNFKbHJKUq1usZlLQzjTuOS8R4
	 EyT6aFP5QJ/ivoF938fsuSncvAuNsraxi4OQCFldp/QM1dBBCV0DvAXrsxd5IyPcslw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JGeknb2t;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=En6+awhG;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1950960A2625
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 14:18:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1950960A2625
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JGeknb2t;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=En6+awhG
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AIDPw072892390
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 14:18:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RQTRlWlNPA7govfbrjAsnCPFLMb47f+N5ey70lGllSA=; b=JGeknb2tViyDvGl8
	3BCVGHNICyr2ccVqmRl7PS6+MGFn90J6095RMb1sq87/T8yVcQ3jjRMWy9Ft56hv
	3vgu7L/be2+NpVVhAVt3Hu08CdFYY3hxehxMHiypIYTnLZkDhZNoRGLsJiMdidPQ
	s/ndHwyqTKmzLOa/mxgwkd6IuVebN1WWxdpil5cQfYtYva5doOu9YV9rwD7kobPP
	quwOqtqtDTWggARhD1sCPpqVr6uaG3QQnMX0eHYjbbjqEv/IIiVzruLej/kweAPD
	mNimq5RIPOloMJRH8P0ZVg7k09zaDEA98CbGBm62LnkRS0hGrKkwgWjJzVx/haL+
	Rd1bHQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv93dq8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 14:18:58 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2eff4c37998so8791085ad.1
        for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 06:18:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795011538; x=1795616338; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RQTRlWlNPA7govfbrjAsnCPFLMb47f+N5ey70lGllSA=;
        b=En6+awhGYP9GChrqlU5mtkgp67ZyxwgHlS2g3vjPK+0E1L3NQB1ok1kgDURr0V1Slg
         14oUQZuS9H8wsvkdMQZ5WB5yyY8iVCuZd2MT0FcVVbA2exiJrFrVNxyIhfwxQP/1CjEv
         BSxPU6f5XBgF0gJofpIHxssaTSn4LgnDiaKBERIbcTa81/YJQD3o/+B9T457QwBg9146
         8bJTomecJxUHZUZmaBKJuZWQrl/b9beJWFNb7kVWl2jjzNK2JmfjcL6ACnxoXbcX9MAG
         Dq6187lFtz0xfG0LDucYnoH/yhrLVtr8V5fQHgku4ytPhMySSKWvv4ImcIiPSlTBlxBd
         JhHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795011538; x=1795616338;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RQTRlWlNPA7govfbrjAsnCPFLMb47f+N5ey70lGllSA=;
        b=v2rzRsHmD7iSNVQon7iZgWn8YY6/nQ8wOcDohMJtnvB8YQmHHw7bJ4GXRRBxp5Z8Y1
         4GRbJZgFPgztK5iMoAJBTyO9qJPjF1msB93kRsBEMS/7IyGcCYsCeZQu+tKuaKnrWvlr
         QmM0kdYFPoEypz7MweEQDoRJgs7UmJi/EPzEgjVDvhfP/O1RMBcm7tyWaQgbkPrJSEG/
         CzespDgD154QlS/+jrK4+EiPcikkDqUpDygIy56QSJzDDEybjLoolhOy4G/y5RMVTZmZ
         ebvEhY+2CR2UBZu4T3t3BFE9TW9TBByfTvdAf+nO0rYL6JIQULuvN31iU0NFQgwLJCSd
         IUWg==
X-Gm-Message-State: APuU4Z8B8cu/CqoS0QbG5+I1NnbK2HQD6Ve+6NLNiwxdos2L/x0Yy335
	SoU2zpt4OW/a68gByYYPDsZwGRLD2uN8n6KIPmxV1buMUZ/RR79nkbYQIVlsBA3zNyNAIouLGNs
	O2NiNFm5K/h+kx48zeZ+OjctFu0Fl5FGyUB18A2/V3sPgpmQ73s6xA++W9Flf1uRn6OqR
X-Gm-Gg: AZFdTZfQDSUH7fIuAV/DtOs9zS8e8juuulG0nZfT/tPFYNtvclhxNwa+F9Vsi7pcOl9
	qmIf6DOeKEW8eYzXV/z9YxizYziOOLdGZUa1qeN228QYUK1fqrv0sdPgDlE6lUb0yyg/+WqeITA
	J8X+NQC27zfHjlR/qPTQK4zSLqwoRq/mYK7Zim0AnsAZ0cmpccRauPAK+uLQDZPuDVOEJtUFrWy
	bBZkpS0xuV4Tt+VOenGCCr3qcp3m8NIFJhfhUyHBghmt/+ePHZSWMB2B4J0MbMV6dzaLpZZ5FGc
	CeJvMyo8PJGLKVSTlvM66b8pWL42Qt4jSfQNsjSbzGDm0/rBAfIBCLjXJpN6sQraln0Zfa8H0oR
	UW0q6/GY5BqqZt6TyqB9Dey4AVjyMBpW3FBbMfkxezk/wbIqhJr6XF0Pw1QnDhR0mKhq/d4Aj15
	RFo1oc
X-Received: by 2002:a17:903:948:b0:2e8:4f03:dbce with SMTP id d9443c01a7336-2eff7541990mr25026375ad.51.1795011538255;
        Wed, 18 Nov 2026 06:18:58 -0800 (PST)
X-Received: by 2002:a17:903:948:b0:2e8:4f03:dbce with SMTP id d9443c01a7336-2eff7541990mr25026115ad.51.1795011537797;
        Wed, 18 Nov 2026 06:18:57 -0800 (PST)
Received: from [192.168.0.104] ([49.206.14.199])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff622711asm14623665ad.47.2026.11.18.06.18.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 06:18:57 -0800 (PST)
Message-ID: <9a7c9357-29e6-4967-9e45-ee62072d8637@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 19:48:54 +0530
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
Subject: Re: [PATCH wireless-next v4 10/21] wifi: nl80211/cfg80211: add
 support for querying SMD context for target AP MLD
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261106-smd-v4-0-62e39487f51a@oss.qualcomm.com>
 <20261106-smd-v4-10-62e39487f51a@oss.qualcomm.com>
 <29b38fc6c8a5f1b2b58d81c1a9046308d2ca9e2d.camel@sipsolutions.net>
 <18544db8-05e9-43b9-b60b-bf24e97a1225@oss.qualcomm.com>
 <a31c882bce704ef51c71f16c63377a7d234d1a67.camel@sipsolutions.net>
Content-Language: en-US
From: Pooventhiran G <pooventhiran.g@oss.qualcomm.com>
In-Reply-To: <a31c882bce704ef51c71f16c63377a7d234d1a67.camel@sipsolutions.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDA1NiBTYWx0ZWRfX/X7l3krJIlUb
 vkgAdJxk+/NA5moqvdH5PqXoh5QMq5FzUVSsL0p1riW4zDLZUtjH+QQuDgqwlvoNWMk1Wp9oyN5
 ip6X2unCbehfaHUqubVgREZ3lufC0emsbPg0h+6gDgm4unZ9eW+p1so41iycErKr4ZCFOrId0I8
 HFYvRW5JJSr1QOvyX2mrGNvEy9ulQNtd0NfHuWZ/vGJINOMvMoF4vqBUVDf2DJE2XDMg39hQWwv
 GL/3BCbHXlvV49CP4ssDXj2NRFqZx/SoiqGpS/aseMdIzlmOLLPUUczFenDD+M2rfqzMScngmUn
 PTEKBthC2vOYbQdx/D9t3f1tY3890ptI2pnzifvr+SJ6yFpWHQoBbH0UgwgVVKCn5q7kXsVrZ+h
 8otJLq/MmE/i+IgDtY/QJJcraUC4ZMdSjFccFee4pwVR4wU/fBdl9H48Qhlyl6RydS3EnP5ccc0
 viydup01PBv8jTb2Caw==
X-Proofpoint-GUID: qlyUfCxT-YqR8qBbTfEz2Ur6vp8FBLjV
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDA1NiBTYWx0ZWRfX1zZ8QIF0uHVR
 mQx9ws5yPQAizIQfdzBHuXvVzWUFYLKgWU/MsJqm9DxxOAEuUj/EiM5kVjFAMMlh9JglVLURlj4
 8qUsmCAZI/avXbxPf3nvAPqkexjlB8Y=
X-Authority-Analysis: v=2.4 cv=LuQHWXdc c=1 sm=1 tr=0 ts=6afdb3d2 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=S4TnAKnbd+bQPtf57r7XhQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=nI9ZkuOJysPLxIuzQA8A:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: qlyUfCxT-YqR8qBbTfEz2Ur6vp8FBLjV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_04,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 adultscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180056



On 11/16/2026 04:50 pm, Johannes Berg wrote:
> On Sat, 2026-11-14 at 00:03 +0530, Pooventhiran G wrote:
>>
>> The netdev reference is held to prevent invalid accesses to wdev/dev while
>> reporting the context back to userspace as there are no locks in this path and
>> another core may be servicing a DEL_INTERFACE unsynchronized with this context
>> report. Since the collated context report comes from atomic contexts, we
>> wouldn't be able to take wiphy_lock.
> 
> No, that's just not right. The driver provides a netdev (wdev)
> reference, so it's its job to not call nl80211_notify_get_smd_ctx_done()
> with a stale netdev/wdev, however it achieves that.
> 

Understood. I will clean this up.

> The address is also already provided by the driver, and cfg80211 doesn't
> need to track anything.
> 

The address was used to allow one request per STA at a time. But, as
suggested, I will let the drivers handle this to avoid the tracking.

> johannes

