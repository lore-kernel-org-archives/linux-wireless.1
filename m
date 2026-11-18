Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795011058;
	b=t8Jp/1wUxGw9OqCRbSkP1Oz2wjPRKda8rWeEgpGL2OVhX9mhkqZITQOCjYsJNUIKyqvz
	 vRwkeo8QjdHg2f1L4OmC3EibspOFo24H8b8mzd+jtC40c3aKzoi28AyNg7EkxZasfhubf
	 zawYP4PkRG6tI6EbjoHOyb/k/LUagqrqi7kgHHMkTt9qZAelc/+0QRRTGHpOjWYCl6vmc
	 QMpck/NJbidskvne7qPS6NiQAvX93bZawmzt33KlJDl+4TJl3V+y/LiAsZ3A8bHtin6Hr
	 DvaXbHDVQYW9aYQErKgfUq752lpRv4yv28GfojS2nfK7zgKE4a/9DGHBiWyql4Da/lg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795011058;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=vVgoxX8wQpYAnqrIzdoNyOx27ZT+lPcYdylsPsy37/E=;
	b=F4TmrHq0FamLc6lDBLysa8u2BUOBqJXyEBvDgI0FvI88KoeJuVqEkt0wKyKC2UwmD8QC
	 9jsHswbiFRP5KhSI4UIDpA9havbTTMwLltd4EcJV+17FHjXW4BdmFpg40izautNXyJ4ZY
	 8dH6S/rUruF6+AiYeLLcaq9IX9eNJfH+x4nKv5ncz/8XulrO5/SGXHBqExApxc8l7tAic
	 xVxK4Z7el8e9Muqy+0vxmVPGiruvbews7sGqZGAyhZinPKrD2iZUCppr1Q2TaTyBLrx+q
	 U8M7xgUjhyEi7ITot6ez6GQnBxDFBvpWgqpvU29lQsydlXi74S0pknqVq76GTswjDhQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="pw0tKQz/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SpwEBh3O;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 847D6606A331
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 14:10:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 847D6606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pw0tKQz/;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SpwEBh3O
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AIDQnvl1929497
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 14:10:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vVgoxX8wQpYAnqrIzdoNyOx27ZT+lPcYdylsPsy37/E=; b=pw0tKQz/q0AmQYbp
	PcdexN8Ph2was0Tv+9jM1/I41OLhj8swhql6Qc2GMtTjngAZ+okU+XGXnBX2aLfN
	FOGF5bo5ddV9YGEQxFa4kmiGZB0m2GXRxVtdIOLLSFFc6g31oTN3Zjw8fH1pqgjv
	FpLTlm6choInrpH20Om1bztq6xYKtku02b92ks4/vCTPa16Boq09z3tMCe0EBO2r
	Ra2qhhqrBjJZElRpyR163vlXuKXR3ifxhFCwMnG/N2/IgLBmnlqFN2KTO6UsifFa
	6zgEZ7/ZgmWKN9lbM0GPG5bYKZ26AuolUc8mARbi38j5t+0Ga640Q/74n0xNCPTT
	ET9ZAg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv8bak0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 14:10:56 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cdb869327e7so967910a12.0
        for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 06:10:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795011055; x=1795615855; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vVgoxX8wQpYAnqrIzdoNyOx27ZT+lPcYdylsPsy37/E=;
        b=SpwEBh3Ooc9818abou6YAoH+kcXEV+aYMyT4Xic+E8+NIAl5IkgGV2Sg2Owouw4Ki9
         sM+jRz+44Ad2Xqfud7IDcsgjLcXz1YkhgV0el14OThrubp2TXGzEwUEXoGZTxSawjmo0
         lzfUmS69CGIkgKbAn5pJ8AHZRUZruTj3LdYN2hljcHHYtPloof0PY6LWaFHXVzcOig99
         m+hALDJVtrXltAl0gMLCpEWckgaWwtTJBASQki5O+e43odJgeJ4wP4Re0poRMlvgwvu6
         xMgBGw/83eijNhkv9QzasdSYM6L9QlZvPldfh0SROWCvcUYSYjbahKxmdaCwk+K2GQz0
         nMWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795011055; x=1795615855;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vVgoxX8wQpYAnqrIzdoNyOx27ZT+lPcYdylsPsy37/E=;
        b=XCRbGSWqhP59mbSFSsRizn8ypaE09ohS7HW8whU8RhIX+WsmiMZcM5s9nJ1aoxBJnk
         ZKj9dLMCpHw5DVsKJqOxD8wByORzMIZeyN+ZjerZyNnQl59MNgbfg6nbAOaXpNp4O+dc
         dr2otVGkrMOMSoziOBWvzSKpYxjmpjDILp+IPlZ0MWQovHCHyHveDH2ipVURCAB8nE5i
         iChEgWaDNP4lyoLSoU2TtiDsSoDzMTVdvdIlow1sA2v2zki48ihpxDdhjx+Kfdksn3rf
         vWABRsCXyFzz4V++kv8syUoVQDh/fbvjHscVuBJGkNA1sshPDTUC81Vif3aI4vyiuQz0
         g2NA==
X-Gm-Message-State: APuU4Z+EReoA57iXIZeJIFtvcrvHqDXgYp4GiyYRJqVfxaHB6MuHWEew
	GZtOjw8ZxrItEnvltMkkpLGbSeLaL6BRlscCnHb3jyMdq0QjG/Q+AkBZPUpOx7yFwhZFekLkKMi
	DvPFrOcgElCgryhHHpIhYIueYqCSw8jfpc/G7e9Y6xlCHsP1jEofZT66VjUPLL1nzelvq
X-Gm-Gg: AZFdTZef/AaniMqEg2mJ6td8FI9gxj4uIvev0tcOw0nc9g5jDqaypvnFsm9ByLW6cX2
	ImSTAfES7G1gDkWqbFO3cP8f6kYb/hn5KVsYMZHDETzuQVpkftUtm5lsN64tMJJHF5rZLGt5rHC
	TLqU6psGdgWP1Z9lAY61iNJhjd1ZOmtNRPOpY8D/288NPsXCiI2zLcfjwEf+bgu3KoObLlzUNY8
	d+ln8+09BfqtHIZ8bIl42JnG+LLG8/usl/MDK66bUTe1NrJxcNh7XtUFwGsVjH+GKeU4EC1Rm5P
	G5SG2WBEzdq3pwFvMs2/hoodD85x/il6l2Ou9ACgi8/PrQFVWwj7KZWstl2ZXmO8rew8+nyWyv7
	+41jeLnHrPmXGoZF36xYgrICQc4YAbz4vT7RePczSvyjctbdA3Hb35e1ILG+rUf0yhGY+aYgNSE
	gDkV1V
X-Received: by 2002:a17:90b:4a8f:b0:3ac:a203:e0a5 with SMTP id 98e67ed59e1d1-3b3d074e290mr2948075a91.11.1795011055152;
        Wed, 18 Nov 2026 06:10:55 -0800 (PST)
X-Received: by 2002:a17:90b:4a8f:b0:3ac:a203:e0a5 with SMTP id 98e67ed59e1d1-3b3d074e290mr2948053a91.11.1795011054570;
        Wed, 18 Nov 2026 06:10:54 -0800 (PST)
Received: from [192.168.0.104] ([49.206.14.199])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3d5570208sm1930170a91.0.2026.11.18.06.10.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 06:10:54 -0800 (PST)
Message-ID: <d32a30ed-77b6-45f2-abf1-25ffaf4f6c4e@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 19:40:50 +0530
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
Subject: Re: [PATCH wireless-next v4 08/21] wifi: nl80211/cfg80211: pack SMD
 dynamic context along with frame
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261106-smd-v4-0-62e39487f51a@oss.qualcomm.com>
 <20261106-smd-v4-8-62e39487f51a@oss.qualcomm.com>
 <db523e851beda07c6f52f3c094b5ea2bf718af03.camel@sipsolutions.net>
 <338b21e4-b23e-4cc9-930a-8f043538f881@oss.qualcomm.com>
 <cef0d4146270d9f01384129f72259f9eceb08a36.camel@sipsolutions.net>
Content-Language: en-US
From: Pooventhiran G <pooventhiran.g@oss.qualcomm.com>
In-Reply-To: <cef0d4146270d9f01384129f72259f9eceb08a36.camel@sipsolutions.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: AlFbu9n2-on6T7qvBBvFsDGKrlHRvtOu
X-Authority-Analysis: v=2.4 cv=N9u8hG9B c=1 sm=1 tr=0 ts=6afdb1f0 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=S4TnAKnbd+bQPtf57r7XhQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=GHX8rU4FTOl6s0DoZrYA:9 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDA1NiBTYWx0ZWRfX2GbC2lwnjjTL
 ALGDajEdfuBthoNxs7O6eEVIQYqdYAxAZZDTmyRZ41ZwyjKundMPBjjmKmZP8/cG5kjL0GKtsxj
 rb3WLtHoFkA1RzNWPKvfnW0ZEhsBSxRGytsKTbDZQduF3jSuv6ZomE2HImbTMcgN+rNEYTLa/Ph
 LECfr00rTt7tBy6LY/5fdpTjvMYK7uRcp8VW+g7EFqrhpIIv9VQzA0Q014fQrv57Lv0F1SE5C0w
 rg1xx9EbwxYTcWwuk5fvGbRZBIR9wHPIZDd2nUUpcG87u4EiZWWLpVccexIzvr5Oil9I3hBDx64
 2yhfB4WoM3C5sINDJ005R7+kDUU00it5t21B28IJOlYWfVd0/fKyaDACKVdBdBDAfK8qGlASMyZ
 vJxmSOoAduqpUTmml21gASRKkx5lGtPFAMLIh3cVXun47mCo1ArgLzYWxYugl2ZN0+eL53saMhA
 a487WWAtUuq3yfiahgA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDA1NiBTYWx0ZWRfX/vMREuCQfdT/
 Lyh3TNVQ3A5jGChPxeisL0qSTg4P3F3nWahJ/cI5rWujKoPmhV4b3Dudhz57NGz4uLCFLNHvmNx
 iT+lpNVR+fTi8KAPt+Jm/kcRc/P5oQA=
X-Proofpoint-GUID: AlFbu9n2-on6T7qvBBvFsDGKrlHRvtOu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_04,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180056



On 11/16/2026 04:30 pm, Johannes Berg wrote:
> On Fri, 2026-11-13 at 23:47 +0530, Pooventhiran G wrote:
>>
>> We moved to computing the size instead of having a fixed value because we
>> transfer an almost dense context in one phase but just a very sparse one in
>> another and thought this would save space on the nlmsg skb.
>>
> 
> It saves allocation, not actual space in the message or for the
> userspace copy. I'm not sure it's worth doing.
> 
> The biggest problem with this is that it's basically not maintainable.
> We already see this in many places, with fixes to these things, if we
> have allocation and building the frame separately.
> 

Agreed.

>>  If we transfer
>> data as D2.0 says, we will transfer about 330 bytes in Prep while only about
>> 70 bytes in Exec. This assumes all 8 active data TIDs and without nlhdr
>> overhead. Is it okay to define the max size (~400 bytes + nlhdr overhead)
>> nevertheless to avoid this size computation?
> 
> If it's really that small just allocate NLMSG_GOODSIZE or whatever that
> is, which is a bit under 4k so it just takes one page? Don't think it
> matters here much, it's also short-lived (if not you have much bigger
> problems).
> 

Sure, will move it to a fixed size allocation. And yes, it is short-lived.

>> Ahh, I think I misreferred some examples (like cfg80211_net_detect_results())
>> to cancel the inner nests but are pointless to an skb that is going to be
>> freed. I will remove them.
> 
> It's also pointless to cancel inner nests when cancelling an outer, but
> I'm sure we have plenty of code like that because the mere existence of
> that API seems to make people think it should always be balanced ;)
> 

:)

> johannes

