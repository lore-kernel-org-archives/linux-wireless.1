Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794592456;
	b=yitgVhpD8Poe4ez3kHX7SbIopyGYaYGkrlmFf7SzovNlBvzxcPuR2JlZb/QgeO4/Lqph
	 5gPfCvUuGz3fCU0Wqs8gUGILe0IuR6JiAQRuDrWyWJXJCiXuHXL+35ajrqlTKyZ4hX9MZ
	 wPfORy3gymo8rX24JXQkyXf/ot9rLAz1b/muTAgmY6AvqBRUtsdqjrCvRrYIR2FaPvEo0
	 9xedyurqq2yCacLle4kva16XGMixoqYrxNgx4YjqT27JheZ6TD4/l2OUsCqJb0N3glmb0
	 OEeJK0Bvm5vddrEiVGPODbZnumXpMpufRC+vF/Am06A9YQCn+E3b4Adxaq+UPU5vq+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794592456;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Hwnvv4qrANhxix7v15djjdeTI/Np65zNnPxfeeQWmYw=;
	b=g8GzBF3rLcSW1EZj/sYHIySMN/FBn8JRY1AmNu+73He9EQ2B3J7r3eORsGLK33P/Jyet
	 36Sk9xQia/yuu+IKYwffd3RmlgQ/0Jelu2KL/Z7/Ed36/0InO1CjpVJxQIlYSahIEPel0
	 pJEeQUcq7hcLGtHI6TRnurbJvDIBQs2bE7/cWtoq2ashgHLGEhHQdSI1P/CuCgZewobQx
	 YWdeIhZaVb874oU8doXBux9eUCIywHZL99f4HN0K3yHQzAGNRpZSuPAc00QLblEUBYd85
	 7AlkeNLSogtLoAHbkNgy0BCVzUT6O+fikR2lLm1S6Imqsg7I839GjcZzRAgyFaced0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RvYFrqMa;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="LbvT/iBH";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4434A606A883
	for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 17:54:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4434A606A883
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RvYFrqMa;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LbvT/iBH
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADFRR3t738055
	for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 17:54:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Hwnvv4qrANhxix7v15djjdeTI/Np65zNnPxfeeQWmYw=; b=RvYFrqMalwxajLoU
	PPG339Qs0t4TGnQf0OIfOL5ER9gpd4hWBvFLx41oa2xMfdwKi6sqeAZGZAWyNlx/
	NBwmd9jrxtPKfo0mj5XLdHqmfR40MPP/Xos75eP3mZefMikfzwNkJ9ofN0d7K0KN
	QwURgWNnnQlOYMBOODxb2MgJMr2s7JGJmpcxECoD5KR/6oI+sjBb6xf2Fj5VFxU+
	uvUvzGjqTDGCzlJoBbNxScMimNhnAinCoOZ9tlKWeOjcViMo3O2Djim8ThNIombE
	Fly7nJ/6jTtlWiFKjZTp+0SkD6teq/m5PAOYQjmNmVqQbaqqX+R/rXrMNYUoK++Z
	99xjZg==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwv37jnd9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 17:54:14 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1b3b5b49cabso1140463c88.0
        for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 09:54:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794592454; x=1795197254; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Hwnvv4qrANhxix7v15djjdeTI/Np65zNnPxfeeQWmYw=;
        b=LbvT/iBHkG+dy6r8XUDy/3tQpHk1DZUVGKSTWWd+Z70dxxfLUgffn6ZkaK19M6DJRI
         0+y0cVSXs4a0KWYdYu7pb292ypPIJqnuERy9jiY5XkIRgRSp2z7BbsP9pm6LfX6sSeHg
         lbRfO75jK64+g4RFO1ZfaYGFwzDSpo4Snq7iK5bj89iClfwd5kSTklK2c37G4s2SPibV
         OttoyhfplgH00TUSXs0yLyQjDPhkWTflh72FQlE5LTVkC/HZHkIjW/+Ru91QwNGZnpwl
         1/snC2KcDc/lbukkJCP1kqEuMWl9MjfIiY5uSzJ6R/coDXP2ssDUZZVgCAKAaHrQcCwX
         /QYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794592454; x=1795197254;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Hwnvv4qrANhxix7v15djjdeTI/Np65zNnPxfeeQWmYw=;
        b=TCBj3lME0asTkcCis6rW2WL1kgtHgZ81ioq8rvm2QflbqiCxNMrUn/IebdlmYxlgF3
         7PwjDyC1zBIV4ijsH2ReYPMtHjFVBkVafDNFSo0i/awJdYpmQ0r9/rkcLpA6OP949yc6
         FRaUPAUYBvUhzZxogQOJy/XYuGdlYB9D4JuonbPlOomcbAnby7n37SmwkIMTHzyLLSZg
         gTDGxHd/5TPH1tY82EP42kcRqY2S0oR0nyXKrTjloR+20kyIYV5LxLmkpJs3TjfgWjAn
         +LIFuwz23B0WbpyBsrlNeTUWPmq+STJ9eBely6o92UnE3QiswHjfb0piU+hxjzEaarxZ
         JuVA==
X-Gm-Message-State: APuU4Z+sGkG3WVXnVFaBQy3HlC/tA/761m4AAxIiBCFqSr6lrO2nq42d
	jAyQos4APSMVVHFocfqfEZW+1/yZ2OyLFMntPTdP61kGRdIuRbsQkZxD13S43fiSTEbyIIvL/M+
	2q/8D3hYB8wPhnD/ZicSEzU9QakDMC3f72TnxMGEQ/+Jf6bv3HyHp3vIx6imjdksd7U63
X-Gm-Gg: AYBFou1ebND4bzTvMBO/8ldhTHd+Yd+F6IlC1dU0+ROrURzCrwqpJQv01Dyb6ELuqyw
	jovggt4JrL51Paf8dr6Q96S18Xgh9xhcu4Ld2aDT43WCRnNasMWV5uGH/rv1PFmwLzkFTEHCeh9
	eoOXqmn8+pFR7cWq9uWt9BzmkwPwxhSef1KGcz0TejRQElAnX5p1+TytJRHxtm0bs6Qp326/yHn
	9F3kVZuRjdvRq63C66cqpALCfS5CUkbCEWObiSonZlxD4zGGS2xYOx9niG0lVCE/uJGxRJr0sAZ
	r4za7JbZGlSIZHj9QX3Z1Jaj66adNnOTdSg4Zv1WuTTHaZsDBClC3EPO3Ej7aEeJzXo+KxqopDe
	uBeKUJqqlI7ux/vbFcNYNvqNf98ex3/VsZASshNagFPfsal7rMZXC9ian3gHnhgoXtqjL/5+oVw
	tYz3NuAa8OpAHd4WsRD+uzBwv+tBpl84zmkYNFlVdv5aVC9v1yWae1CXCLxq7zhyBxYg==
X-Received: by 2002:a05:7022:b0c4:b0:14d:c53a:f6a0 with SMTP id a92af1059eb24-1b5030d7aa8mr2544973c88.13.1794592453855;
        Fri, 13 Nov 2026 09:54:13 -0800 (PST)
X-Received: by 2002:a05:7022:b0c4:b0:14d:c53a:f6a0 with SMTP id a92af1059eb24-1b5030d7aa8mr2544955c88.13.1794592453129;
        Fri, 13 Nov 2026 09:54:13 -0800 (PST)
Received: from [10.50.62.158] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031b98e5sm8836828c88.14.2026.11.13.09.54.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 09:54:12 -0800 (PST)
Message-ID: <2be101bb-081c-4d6b-93b6-a7cea3f183f2@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 23:24:09 +0530
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
Subject: Re: [PATCH wireless-next v4 09/21] wifi: nl80211/cfg80211: add
 support for SMD context programming
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261106-smd-v4-0-62e39487f51a@oss.qualcomm.com>
 <20261106-smd-v4-9-62e39487f51a@oss.qualcomm.com>
 <7e6a6640fe034af160eec0dda532259b499153ad.camel@sipsolutions.net>
Content-Language: en-US
From: Pooventhiran G <pooventhiran.g@oss.qualcomm.com>
In-Reply-To: <7e6a6640fe034af160eec0dda532259b499153ad.camel@sipsolutions.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA3MSBTYWx0ZWRfXy6tZhbAq1Ejc
 OCofEevvv8KaEH6SDdIehqOXp7D2cRKvvXedEwpUunTt9sWEfL35gR3UBmodGl8TsYX+4RZ7wDE
 qNR66uO7SgDMVQ1eEO5QgqvR+Ud+iLE=
X-Proofpoint-ORIG-GUID: 6ITIX1ImkJ2OgmiRVLkPaNyHWti7tQpT
X-Proofpoint-GUID: 6ITIX1ImkJ2OgmiRVLkPaNyHWti7tQpT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA3MSBTYWx0ZWRfXz5ePkSdycdHV
 q3SeOAj0ZHycvrFrKLDv+3WikYZeC47xyajhxdz8imk5e2OTUKm1CCf04RHb1jjz/l5j+KB0fwH
 S/WkivH4YK6cOiwCcbSBbNAEkGn0BNsI6+hT9Z7NoIpqcQfKWFXomEAKbx22b3yltc/GQEZjCiG
 FLwNdLsiJrWDvu3MiKZ0x30sqmJd49cUiTj99M1MzMTyVzWIv+kI2GICLrb8c8cZpTEg35NUXGm
 4njaQLzinaHVbdZlKyQ/UydLiuvjDljjvVHjuqrvEXtl5wOORS+2XG6Ez+bcTiOPVw6oaWlbvln
 1i14kjHo7Ks4sWboqYW2ACXOl25aYYRSrtmNFaNs+T4vGWCga9UeNP8JUEHdYDkVUUcg6W8LpuG
 FtBOOPoF/f2kyyvnMRct1PxNhSFYHUWO9G9z50SrmHXh64fSJ9gc2p/mEttQg9FFILn9a+Vc/Kj
 TXsjFuaJHQNhwSoUKIw==
X-Authority-Analysis: v=2.4 cv=ZeeIpcVA c=1 sm=1 tr=0 ts=6af74ec7 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=09HMBOQARD8bikJQYYUA:9 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_05,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 phishscore=0 impostorscore=0 bulkscore=0 suspectscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611130071



On 11/11/2026 12:25 am, Johannes Berg wrote:
> On Fri, 2026-11-06 at 13:28 +0530, Pooventhiran G wrote:
>>
>> +static int
>> +nl80211_parse_smd_ctx_ba_params(struct nlattr *tb,
>> +				struct ieee80211_smd_ctx_ba *ba_tids)
>> +{
>> +	struct nlattr *ba_tb[NL80211_SMD_CTX_BA_ATTR_MAX + 1];
>> +	struct ieee80211_smd_ctx_ba *ba;
>> +	struct nlattr *ba_attr;
>> +	int n_tids = 0;
>> +	int rem, tid;
>> +
>> +	nla_for_each_nested(ba_attr, tb, rem) {
>> +		tid = nla_type(ba_attr) - 1;
>> +		if (tid < 0 || tid >= IEEE80211_SMD_CTX_NUM_TIDS)
>> +			return -EINVAL;
>> +
>> +		if (nla_parse_nested(ba_tb, NL80211_SMD_CTX_BA_ATTR_MAX,
>> +				     ba_attr, nl80211_smd_ctx_ba_policy,
>> +				     NULL))
> 
> if you set up the policies correctly (and you should, but I didn't go
> back to check now) then you don't need the policy here
> 

Sure, I will remove them from the parser API.

>> +		ba->amsdu_supported =
>> +			!!ba_tb[NL80211_SMD_CTX_BA_ATTR_AMSDU_SUPPORT];
> 
> it's not super useful to use !! to assign to a bool, and if you wanted
> to be fancy you'd use nla_flag(), right? ;)
> 

:)

I will clean these up.

>> +		if (nla_parse_nested(dl_tb, NL80211_SMD_CTX_DL_ATTR_MAX,
>> +				     tb[NL80211_SMD_CTX_ATTR_DL],
>> +				     nl80211_smd_ctx_dl_policy, NULL)) {
> 
> same here, and then it kind of cannot fail, I think
> 
>> +			nla_for_each_nested(sn_attr,
>> +					    dl_tb[NL80211_SMD_CTX_DL_ATTR_SN],
>> +					    rem) {
>> +				tid = nla_type(sn_attr) - 1;
>> +				if (tid < 0 ||
>> +				    tid >= IEEE80211_SMD_CTX_NUM_TIDS) {
>> +					GENL_SET_ERR_MSG(info,
>> +							 "invalid DL SN tid");
>> +					goto err_free_ctx;
>> +				}
>> +
>> +				if (nla_len(sn_attr) != sizeof(u16)) {
>> +					GENL_SET_ERR_MSG(info,
>> +							 "invalid DL SN len");
>> +					goto err_free_ctx;
>> +				}
> 
> You've got to be _kidding_ me, why do I even have to get see such
> obviously redundant code?
> 
> Please read your own code.
> 

With respect to the attributes and policies defined in
https://lore.kernel.org/all/20261106-smd-v4-5-62e39487f51a@oss.qualcomm.com/,
DL SN (similarly, UL SN and UL PN) is a nested attribute where tid iterator is
used as the inner attribute to pack the scalar per-TID SN and there was no way
to add policies for that (other than having to define something like [1] and
use NLA_POLICY_NESTED).

There were similar changes done for array of values for
NL80211_ATTR_CNTDWN_OFFS_BEACON, NL80211_ATTR_SCAN_FREQUENCIES, etc., So, this
approach was done here to make sure that each SN in the array was u16 as
expected. If there _is_ a way to add policies for the iterator-based nesting
of such values that you could point me to, I will change accordingly.

[1] =>

struct nla_policy sn_policy[8] = {
	[0] = { .type = NLA_U16 },
	[1] = { .type = NLA_U16 },
	...
	[7] = { .type = NLA_U16 },
}

> johannes

