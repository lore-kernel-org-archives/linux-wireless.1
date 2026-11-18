Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795010088;
	b=k/Rc3esmyaBMHMNMPvInOAg7W1K8oqVhdFINy4Di4LAruHXGRdQt3pjxhrJdCy8iw2yn
	 4OJuE/zqKg3EiNP6X1D9H4q13+Nk3TF9dJ5zmo5bvKke9p8Ql074ocKXIcVdZkeg4GNMe
	 o1ZLE1w71HLmlDSsoIRPtsgbUFBigzBNXuxsYc0k3yC4iP3QdkR+7IlNP3N/pkGAko27o
	 0eibK648beLYu2R70RmqaM623QsOHXobxf6HYqp5VsILM54SVPFdq0zMHq1tnJfvJLhOL
	 iGjc5EfTKDNbYT9cXvHRjDw7UCuYRTDTgtio847BYIPRtcZ6OrqdqkyAWf+4jywkyGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795010088;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=RcHLDTMuSspEhVa8CcCcNAJiFwogZdDKAZ1XOR3Vd0U=;
	b=l+btB0DzTtS/DfQouLE0WJNqLBSkDidpmBQVsqjXB0cXxaDHICCcyfhz6oajayCFGLht
	 ITT9mGM5sWCrJDnMtkpseKS9pIc6+VZc1RloYhUX/WLOmBRtyDDrnkQNFZDM+YiFWY1F9
	 ZU19adswU59XEyigSRv/lQaak7p3ea6EOdcxG31GcoBtU9JS70KfmoEy5lsSbfs5JsnoE
	 rkoimycTwpW0FQ3ONf4GnLs2Gx560+WvfliMeWdz1+FJIr8V6JphlEcNBVNgakWNx2uT9
	 dE8+24ngsVZDd7iCIsgH2V/Y4pjZnepO6rJqU9ZC3FGvhDBCQnG4lLo4mJkuzTYz33w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=H9gtfsr+;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VWhH5ipz;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9387E606A31C
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 13:54:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9387E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=H9gtfsr+;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VWhH5ipz
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AIDQFUc2892723
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 13:54:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RcHLDTMuSspEhVa8CcCcNAJiFwogZdDKAZ1XOR3Vd0U=; b=H9gtfsr+T002BAHs
	oQE+BdYtXoFkNfZlCjkr+DeqLmm2GOWkU6+ClrSXrETTdX71As5ucDMBLUs4rsuw
	WDTgOQ5aJqUqFnRerufwoJTLGDlF2dxwsLr9MANhZPvb4cjfAhc0NtLYZIk7Qcu+
	ld+ynrPV6Xfas42bX4mN42MYXIJvDtFHgc+cpbdrmCxZ2veywI1eeoHd7Va1qL+t
	Chn0xurxDp+x2exAC6z73ln4wp5Kjt4Rs3mT95CyjxZN7NupcYvo4+lfyoxnCdfA
	XfAmyVI9bOvhGcO/M9Ek9eG3e5uwUKCqPNXJOCQuOzPQjfx/az39HpsQoaknq0tY
	SrGAcg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv93aa7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 13:54:46 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2efdc35736bso14583615ad.1
        for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 05:54:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795010086; x=1795614886; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RcHLDTMuSspEhVa8CcCcNAJiFwogZdDKAZ1XOR3Vd0U=;
        b=VWhH5ipzF2TpRWW1p8XjQKbN7ZNAgLpSCshxhFq/PmqSS7B09Ujny8rCtunVfNQdYP
         85fimqTY+I5PCHjls47xUTICjPOOfynnTvrEPrj8Ii9KlFTeWuOu4XRUF8dol1SdbGjZ
         fRWuoM11SG1UJ+ky5YBMSCWZaMy8SaOTfgfrfDLzRpmYP277J+txsEMMIytpugguJE9T
         s6gTH+/+Brn17cZ3v4VfSuyHrg9zpSBOItVplEPKAX3eI4SjXby1FCmLD7SZDCubGZxl
         qv3ma6r0kw2uagauVeqBD+LPpnqx6KDQtjS3eeqTNG2Fouozb3TDp4RZWQNjDrK/N6ce
         scMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795010086; x=1795614886;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RcHLDTMuSspEhVa8CcCcNAJiFwogZdDKAZ1XOR3Vd0U=;
        b=LCX1Z4i/aWDSRL8J4PqdLshF5QnBYGhIKdvCgabGET6sGT03QDGXPRNQiQ05KSedOJ
         Liev3IwvAyrU/QPfK3pfoorEm+Ms26VG1H6vAHk/xjhUas5ZY5FJocrjyMRcN+J9c5Vj
         GoltNtnuqhRjcbFl2wbvPC/glPIJRykaO2wGFzUkvWfn7cY0JwMqvGgJSNmM6n4alCyT
         6kf9WHb5GD0ukI353+ZjbrIDv65kOg8h1K6lCinYd+IsAd8/hAzcfp5e6OzIEFM4m0xw
         YTn6v+mjAgTJvkFWdotsZ3fCPqEKP6m0WzghZI4qMfMMBWNS0I5lNJPtE6x+ivK4euuT
         Acjg==
X-Gm-Message-State: APuU4Z+yjIHmLG2z8gN1fIxCXpZsKVwuuN6exXq/HYhNzUI43xedk48q
	DuPxW+y4F81Nig8H8c7TtvbyhhqkRhMhwpXqBu7WKYF2lT22mZ0hj2IrVbRxou01KemIUvQWoW6
	BGo1tnisxkI4Si5br3XVch9C4lpDHQhznr/QwtdfAKtFHZcTfQw1J8iChO5UQD9Y5OtjR
X-Gm-Gg: AZFdTZf9CIyn2398IacgOdZe0FxjRXCT5DIjxxD2RyxYpJ9P1XHfeUPoOuJ5IhNWtgy
	+vFW52yCWO1lPoolfQO/u7GrMEDxItS40g/qtHPKKsImjGOp/ESQqMQ3DrLpFt+td/CVfPhKn5a
	6iQANAGRQi9uwfwV5T/ma4uqBtHOhDiswTZ0JEGDaYleHl45ftTF4QENTSTIZYqnLKG9D0/S8Wk
	91bgFeMgiWsm70Ldze5B3wFicMtGnqBegIwa+8b+ZEobMtB8A8f2DB/ePfAg/BgcU/poy/81rQS
	Xlo9inKeFPjv7K27OlHrRRzysfde2/03SjkNwtbn7UBmMatHuw2u+71K6DjAOqTxVMSz1ej3mn1
	4NAu1lMeeXq6IiRluKRXNAdArDjNdO6Ip4Kh+kfF2/f2oZOYfsMU25mt223lKOuLaQvduJNOghb
	2lLM1L
X-Received: by 2002:a17:903:26cb:b0:2e5:98d7:8202 with SMTP id d9443c01a7336-2eff72f34d6mr24752285ad.13.1795010086231;
        Wed, 18 Nov 2026 05:54:46 -0800 (PST)
X-Received: by 2002:a17:903:26cb:b0:2e5:98d7:8202 with SMTP id d9443c01a7336-2eff72f34d6mr24752135ad.13.1795010085779;
        Wed, 18 Nov 2026 05:54:45 -0800 (PST)
Received: from [192.168.0.104] ([49.206.14.199])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff62e1295sm14477015ad.71.2026.11.18.05.54.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 05:54:45 -0800 (PST)
Message-ID: <204b3133-bbad-49cf-9290-9c334509297a@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 19:24:42 +0530
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
 <05d0e51a-7189-4095-8243-fdc1c424e37b@oss.qualcomm.com>
 <61c6b777341edd1343ad1959abc9e2313a05ef25.camel@sipsolutions.net>
Content-Language: en-US
From: Pooventhiran G <pooventhiran.g@oss.qualcomm.com>
In-Reply-To: <61c6b777341edd1343ad1959abc9e2313a05ef25.camel@sipsolutions.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDA1NSBTYWx0ZWRfX2jVgHKED1E1c
 UuKJplv8WrD8FNCMAujj+sHoFTrUOk8SmQVGxsiFWu3RkveuIvfY/I9f5m932Riarib5gCMCbEx
 dZnalaoueCu7qoeAovudVYT6nA5aCNKukOZLsPYG1zEF7MLiFK/pX5KpviG56NnW6eq8xcn1IV1
 PDCHfIhSprsXGseMpZY3Z3z55IBnnDwrdrer8fjNljMQRnXGZ1UBhTuvxZ5ju22weFSSxE0lL6d
 gaCTNQZPZFkge3ixBxfK1ODSdSStiR9/uONF8izaTPiOTvV5n6KDt26uDNXE+fmCsUxAUo8rdM1
 RnY6R8O+/w48CTFF0DhKiY5yn3W/Mzs6eFdQPw5spBE3Vbm9yb22JoL1psW/cTFIetlCtoYVGRx
 F5u05TalRYfcP1yBPtSsvjePRBHT4NY/EKgh+SYlaQCZSMZajvXs4b70yUjA58tQPUCPN96ZAuC
 IVvsYLoYirNMaiECrkw==
X-Proofpoint-GUID: Z0tWdyXD_MQeEX7UKk1fOpfzclBWAKvB
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDA1NSBTYWx0ZWRfXzqVSEbd4V50+
 ymGaVoWTuzINOifm/BAgZ2uZMlRktZ+xY0OdN8siRXnHn2Dg5XY9SO0N9HYWOdemlfF1D9w0qRj
 3bkg5QUEue1g5cak9tdh5xDulS1879E=
X-Authority-Analysis: v=2.4 cv=LuQHWXdc c=1 sm=1 tr=0 ts=6afdae26 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=S4TnAKnbd+bQPtf57r7XhQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=bpt8X80078Pt-H13CuEA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: Z0tWdyXD_MQeEX7UKk1fOpfzclBWAKvB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_04,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 adultscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180055



On 11/16/2026 04:10 pm, Johannes Berg wrote:
> On Fri, 2026-11-13 at 20:53 +0530, Pooventhiran G wrote:
>>
>> On 11/10/2026 07:56 pm, Johannes Berg wrote:
>>> On Tue, 2026-11-10 at 15:15 +0100, Johannes Berg wrote:
>>>>> + * @NL80211_ATTR_SMD_SUPPORT: Flag attribute to indicate SMD support. Used with
>>>>> + *	multiple commands to indicate appropriate SMD support (refer DOC).
>>>>
>>>> This (with the wiphy flag) is the wrong way to do this, we have extended
>>>> flags that don't need the double enum value and pass through to
>>>> userspace directly.
>>
>> I changed the EXT_FEATURE flag to WIPHY_FLAG based on the comments in v2 and
>> NL80211_ATTR_MLO_SUPPORT implementation.
>>
> 
> Yes, but I think then you had more intricate feature advertisement and
> that went away entirely?
> 

Start-ap had many SMD config params which are now cleaned up.

>>  I will change this back to
>> EXT_FEATURE flag to indicate driver support.
> 
> Sounds good.
> 
>> NL80211_ATTR_SMD_SUPPORT passed to ieee80211_start_ap is parsed into link_conf
>> and (will be) read by the driver in assign_vif_chanctx drv-op. ath12k
>> implementation needs this indication to instantiate vifs and workflows in both
>> the driver and firmware.
> 
> I guess that'll be one of those "trust me FW needs it" cases, but...
> why? I don't see how it has any impact on anything?
> 

I will clean this up from start-ap as driver/firmware can manage without this.

> johannes

