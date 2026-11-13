Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794597648;
	b=1pe5CKUJvDytrCpyvL+ClRqGfB0pekKTL7QcG+dOFEKGMC9iMNlLH4x2Nv2y8joalvie
	 NEE4pXKDEF66hkETML8M9iksotXVkcBU0iUhQNFl3ghfw0FlMRQpD4p+pR2vuUgeNYIeD
	 /Xx4wYajsbQazgVcWUfEAoxXMudylkO+2pgJFdtYfN1FfIWLhhgOOlKdEiUdU+4rMiCOG
	 oGHjFa38HQ4dPYccdomTkPUDbKBv/zAkaJR9pXKWqk+wPPdbzD1dCZn9PmMpwi3R2zQ7U
	 mkOIDNbkY5k4HIw8dr9RSGt+hgPVrx8FJ17KdfthUF0Hxme1XjLfFlG922+7613bQNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794597648;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=OydMl0vX6nB1Pa0430nIrBP+ORyUC9dy653JxhbSjm4=;
	b=hQxC99doUVHJLUfLShKzakmw6AST3i1TiIWDmzB8+K6jqoGr2L4u3bjMMA2wdK8xdvBX
	 QtitZ/4f+wfKiMHdJAeMa1jYEuU7u6u3b2ALhLR5MFYd8R1lzQGg6feESgM52CtJ+1vaR
	 6aHj66DLLlZXZJjr/HsKshmb5KasLdAE4HwAOwpFmTNgaYRTCJLAUifbaezvp4bVhcKvd
	 oGCNGGCMHFhlEpYFiYr/Am13a5Xgeyu5nzBrGnctPUCX9cOpilYBwnZ9dNFo6SgzG5vdc
	 3XOP5KgVB1W9qD0Glq7NwoVMxwoMZCbelWIbSNqxoCt7zjHYDExPSIKP1L4hvvjULwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PJ315E1P;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HNyVSRMe;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 436BC606A32E
	for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 19:20:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 436BC606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PJ315E1P;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HNyVSRMe
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADJ081f1745358
	for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 19:20:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OydMl0vX6nB1Pa0430nIrBP+ORyUC9dy653JxhbSjm4=; b=PJ315E1Pe06yw2wY
	V3DxheErSFOrD0Ph/BpqFyznv+FRgthOtqdFTl8uLgzU/5z1J9F+5fp50+8/RkV9
	XJko24AePLgTk4n2OeKp9CBnhTKOJFEIzpuHPd9smpEiY/BeinIwWs1MJkSJ0HTJ
	adAVu5o4esbC/pbLHJJxqY2afO5kloXVdAZoaD2pLkJgLg2h6Ef7rx5fgVngG8ko
	aQJZZs2mYFEtoiQQdgJtuKn3mKBlaKtWVj5d/P3g5xvRoJS1jfUCN0y3Q0syrCHs
	gDcRkubOSCFmrYxXvrHUeu6n1YEqC0Lkvwxlqlo2SH6g/4DC6v5f0MZzxidqeSUE
	VXwGpw==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwqufkuha-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 19:20:47 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1b3b5b49cabso1217548c88.0
        for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 11:20:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794597647; x=1795202447; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OydMl0vX6nB1Pa0430nIrBP+ORyUC9dy653JxhbSjm4=;
        b=HNyVSRMeoYUsPcYKKF02zhGD/5dGHuPJ3+Q/OUNhLAtbk5AAjEFO0oDuD80+A66NB7
         SLUeMlKkpGdGpCjXQuKzQfpVYQX9RelZGd9HKv/uz/nSVHxodBjZNm/fWrmLL5s3KBk7
         gw0r5r3+lcUA3ESgvprX69wVcHaeVh6CrCSpcBwm47NuMwOmbfEo7l6eGYdFX7qhbDFV
         Ukgwdi+PBEBxEvQpNzw0OBlMHlLt5+C23PaGF255nLM5zy4hAXXF9MPrA/e9NcFiBRhO
         igIWqUCKa4FjkqOpAg8/3ktI8GwC2gExyl6dd+GUIu4eoes5ekG3yZELY8+7LBklj5+K
         2eVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794597647; x=1795202447;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OydMl0vX6nB1Pa0430nIrBP+ORyUC9dy653JxhbSjm4=;
        b=ocZQfn7Me309bytu6gtjapD+I7MC5GrSWMj6iu8mVPv5YHNs0oMSuvo58AHPWnPbv/
         9i9YJZkRyriOSc5H+nA+neskPDT/OSmvLxZxSxK9xO1kXG4sxe4ERQQo53XKSA/s1j1R
         PJ4h6rTilY1yJcr3rYxUyxw1yg3YL/9zMlp2Ik7do0iXlUc9TdDwUEKyJ2J4SqnpSD5X
         meh3gis7sJfIgE55R/ryqsfArssccfREY5n44sLBfLSdcNMtR8zXjA8oCXX/vQKx39m4
         WfcU5b8aMHtY9H936+GHlSw24voE9oDL7jFKIRIZ2A5KylFso9zmXJpTUHDEEpE6xk/F
         ULZA==
X-Gm-Message-State: APuU4Z9nNrVh0lUg6tfFYXk9vESPbbqcZfylKPD5W9JoG8Mj+70Xty4A
	8e/KZ9Np7X7KWO5TcDsqQYBJlDDnsufmspFPn6Z4uombrHP3CObwC+6yNzxWxAikPXNpCOixQla
	8Gg0Kp5Mk72hScTzlP7qWa98pasaw3GZT5F21ShqcwE9ll+XWQQEOXwj0UVhP8hgJigQy
X-Gm-Gg: AYBFou2CWaYO0Pjmm8FsApWGnADmMscuU1DlZJ58xF5/eYCqFI5AqsFC7o+TfidXMFt
	yLIX3bS+3TZCgiHn89/gMWO/G7qdVqexIUFjp5AVycgX5LwolCxEtxlo0Pl3JwvjJiRtCgQ9gBA
	/sUgzg6IK3NZYM85KXagEhQBEhL0H3lC0u3MQkAJWHP1lBkARWPkzuMZCC9GHAjJxE3s4sJt3my
	qUlarux0+QXTATxuvgEOLQ96SBokn+bfpIzlmXK/56PfUWmQ4PgU9FS9fJFZR0dg/Wg6wKjOSNG
	/ee5UV/nUiXqcoa32PbDKFBgZk8oThqyx/Yc99ZG/0FMH+qIk990etcc+GwlmzaeGhe3tjiVEtp
	QFrxA7asTdIacs3sOf4N8q+NtYlJpZMmg9d96RB3DGdINyWqH4G9xThYM2J7MHhv1qEQNvgodUa
	03oHClrvU94yzJ12FpgWpgFGu9iMZ8NycDNaB+X24gXMmiohuFLEKVsQOMC3fdPQ9xfg==
X-Received: by 2002:a05:701b:428e:10b0:181:5cac:8f27 with SMTP id a92af1059eb24-1b50312eb6cmr3381017c88.35.1794597646712;
        Fri, 13 Nov 2026 11:20:46 -0800 (PST)
X-Received: by 2002:a05:701b:428e:10b0:181:5cac:8f27 with SMTP id a92af1059eb24-1b50312eb6cmr3380981c88.35.1794597645780;
        Fri, 13 Nov 2026 11:20:45 -0800 (PST)
Received: from [10.50.62.158] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031468b7sm11002014c88.5.2026.11.13.11.20.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 11:20:45 -0800 (PST)
Message-ID: <a743c654-14f8-435f-9b83-bccdf2865615@oss.qualcomm.com>
Date: Sat, 14 Nov 2026 00:50:42 +0530
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
Subject: Re: [PATCH wireless-next v4 14/21] wifi: mac80211: add driver_op for
 SMD substate changes
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261106-smd-v4-0-62e39487f51a@oss.qualcomm.com>
 <20261106-smd-v4-14-62e39487f51a@oss.qualcomm.com>
 <9016700a02b45e18e06525b338fcce52a1e341e3.camel@sipsolutions.net>
Content-Language: en-US
From: Pooventhiran G <pooventhiran.g@oss.qualcomm.com>
In-Reply-To: <9016700a02b45e18e06525b338fcce52a1e341e3.camel@sipsolutions.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 0XhwuIrErQe5-AEi1JrQ7kDt9RUBc91y
X-Proofpoint-ORIG-GUID: 0XhwuIrErQe5-AEi1JrQ7kDt9RUBc91y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA3NyBTYWx0ZWRfX7kcRyYO3fLW9
 Fl1CbsvkIVYSdQmPhqOUZw0jjc7O5kXefF15u+136KEMeKJCoY7gftYDVF6OVkVE5LkdL58q37W
 1Z/Nsa8KCF26TSdB65W7Y51Bg1W/1CKfx+X5/EaCCY0MN55AJIAdr0T7kcXh5xuIqImkaljBcPW
 hby2BcSvbxapdC3GplpyPiVQjwN5Vybn6AHpcnv9rycR5PPtxylhJHM/eFdFPp6v/74HfaK4H8x
 +FyrMXpNjdcn9bKEXJZ8ksF7jmLbUPynMkf5A+bj5W17+P41olIIJAZiVWzf1s7g2wBEqku59vJ
 XfdwwJtYLGm4GtdMlwH2PiXRim/+tShFm1NjMxvI5/2V1ci5TwgW82+kbq0lbSHQvNOt901Cs6A
 6Bh+0LXkad54lYkm2WbMl3qOSDHeX0mqrLoH9XB+ioFycsbFD+qSqhFIGeieKuAINoSflynetGV
 jNyp+OHQv9EU0XNs2ow==
X-Authority-Analysis: v=2.4 cv=XZocX455 c=1 sm=1 tr=0 ts=6af7630f cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=j1ChdTNKYmIawi94K4UA:9 a=QEXdDO2ut3YA:10 a=O8hF6Hzn-FEA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA3NyBTYWx0ZWRfX2jvviWHmymYP
 IhSxBbcjh5V7Taxajmdls/BBidMVce9cez6gpM/o3laJSpoRfES5hU9lrk/i2kMuRzaGvPcOZbd
 ENmrfHQlR9nLtGl9aIzg0CX1qWjop/0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_06,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 malwarescore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130077



On 11/11/2026 02:08 am, Johannes Berg wrote:
> On Fri, 2026-11-06 at 13:28 +0530, Pooventhiran G wrote:
>>
>> Valid transition order:
>>   NONE  -> PREP  (ST preparation completed at the target AP MLD)
>>   NONE  -> EXEC  (ST execution in progress at the current AP MLD)
>>   EXEC  -> DRAIN (DL drain period started at the current AP MLD)
> 
> So ...
> 
>> + * @sta_smd_state: Notifies low level driver about IEEE 802.11bn SMD substate
>> + *	transition of a station. It must not fail while transitioning down.
> 
> What does "down" then mean?
> 

Down is just resetting to NONE but I will capture that in the commit to avoid
this ambiguity.

> And again also - "SMD state" not really, more like "ST state"? If you
> want to take things literally, then the state with the SMD is always 4
> anyway.
> 

I will change this to st_state.

>>  	if (params->smd_params.smd_sta)
>>  		sta->sta.smd_params = params->smd_params;
>>  
>> -	/*
>> -	 * SMD BSS Transition sub-states (IEEE P802.11bn/D2.0, Aug 2026,
>> -	 * subclause 11.3.1).
>> -	 * Only meaningful for SMD-capable stations (WLAN_STA_SMD set).
>> -	 */
>> -	if (test_sta_flag(sta, WLAN_STA_SMD)) {
>> -		ret = sta_apply_smd_state_flags(sta, mask, set);
>> -		if (ret)
>> -			return ret;
>> -	}
>> -
>>  	/* mark TDLS channel switch support, if the AP allows it */
>>  	if (test_sta_flag(sta, WLAN_STA_TDLS_PEER) &&
>>  	    !sdata->deflink.u.mgd.tdls_chan_switch_prohibited &&
>> @@ -2954,6 +2963,17 @@ static int sta_apply_parameters(struct ieee80211_local *local,
>>  			return ret;
>>  	}
>>  
>> +	/*
>> +	 * SMD BSS Transition sub-states (IEEE P802.11bn/D2.0, Aug 2026,
>> +	 * subclause 11.3.1).
>> +	 * Only meaningful for SMD-capable stations (WLAN_STA_SMD set).
>> +	 */
>> +	if (test_sta_flag(sta, WLAN_STA_SMD)) {
>> +		ret = sta_apply_smd_state_flags(sta, mask, set);
>> +		if (ret)
>> +			return ret;
>> +	}
> 
> That's crazy, don't add it in the wrong place first?
> 

I will fix this.

>> @@ -3038,6 +3058,19 @@ static int ieee80211_add_station(struct wiphy *wiphy, struct wireless_dev *wdev,
>>  	 */
>>  	if (!err && sdata->vif.type == NL80211_IFTYPE_NAN_DATA)
>>  		ieee80211_nan_update_ndi_carrier(sta->sdata);
>> +
>> +	/*
>> +	 * SMD sub-state was set in sta_apply_parameters() before the station
>> +	 * was inserted so drv_sta_smd_state() was skipped (WLAN_STA_INSERTED
>> +	 * was not yet set). Walk the driver step-by-step to the target state.
>> +	 */
> 
> What does that actually explain that's not in the three lines of code
> below it? Did an LLM write it?
> 

I thought it would be clear to have it captured in the comment but it already
uses !err from sta_info_insert (which I missed). I will clean up this comment.

>> +void sta_info_reset_smd_state(struct sta_info *sta, bool notify)
>> +{
>> +	if (sta->smd_state == IEEE80211_STA_SMD_NONE)
>> +		return;
>> +
>> +	/* DRAIN -> NONE, EXEC -> NONE or PREP -> NONE */
>> +	WARN_ON_ONCE(sta_info_move_smd_state(sta, IEEE80211_STA_SMD_NONE,
>> +					     notify));
> 
> How is that even useful? If we're talking about a sub-state while in
> state 4, then surely moving out of state 4 simply invalidates that, why
> bother?
> 

True, thought I could clean up the roam states before that exact invalidation
happens. I will remove it from state 4->3 transition.

>> +	clear_sta_flag(sta, WLAN_STA_SMD_PREP_TARGET);
>> +	clear_sta_flag(sta, WLAN_STA_SMD_EXEC_CURRENT);
>> +	clear_sta_flag(sta, WLAN_STA_SMD_DL_DRAIN);
> 
> Understand that you need to clear the stale flags, but for the driver
> that just seems strange?
> 

So, this is also called from state 4->3 transition so clearing the stale flags
seems necessary. For the drv_sta_smd_state op as well, if we don't clear the
state in mac80211, there will be inconsistency between driver and mac80211.

>> +	case IEEE80211_STA_SMD_EXEC:
>> +	case IEEE80211_STA_SMD_DRAIN:
>> +		err = drv_sta_smd_state(local, sta->sdata, &sta->sta,
>> +					IEEE80211_STA_SMD_NONE,
>> +					IEEE80211_STA_SMD_EXEC);
>> +		if (err)
>> +			goto rollback;
>> +
>> +		if (new_ss == IEEE80211_STA_SMD_DRAIN)
>> +			err = drv_sta_smd_state(local, sta->sdata, &sta->sta,
>> +						IEEE80211_STA_SMD_EXEC,
>> +						IEEE80211_STA_SMD_DRAIN);
>> +		break;
> 
> you do realize "fallthrough" exists?
> 

I am afraid I am not able to understand how fallthrough helps here. Using that
will return failure even for a successful driver transition. Breaking from
here, based on err, will either return success or rollback flags/states.

>> +	default:
>> +		return -EINVAL;
>> +	}
>> +
>> +	if (!err)
>> +		return 0;
>> +
>> +	/* if EXEC -> DRAIN failed in the driver, notify EXEC -> NONE */
>> +	WARN_ON_ONCE(drv_sta_smd_state(local, sta->sdata, &sta->sta,
>> +				       IEEE80211_STA_SMD_EXEC,
>> +				       IEEE80211_STA_SMD_NONE));
> 
> I'm not a fan of sticking whole blocks of code into a WARN, but I'm also
> not sure this whole "model what should be a one-way sub-state based on
> sta_state" was a good idea in this patch.
>
Could you please kindly clarify "model what should be a one-way sub-state
based on sta_state"? Would you prefer if the driver was able to directly
update the state as well?

> If this _fails_ in the driver, how do we even handle it? Should it even
> be allowed to fail? What's the point? Worst case we _technically_ break
> the spec and continue accepting frames from the STA in the wrong
> substate, but otherwise nothing much happens?
> 

There is no handling for the failure as it is not supposed to fail, similar to
sta_state. But if at all, driver returns a failure, can we simply ignore that
err unlike how a sta_state WARNs?

>> + * @smd_state: Sub-state for STAs in SMD BSS Transition
> 
> st_state, or so?
> 

Yes, I will change it to st_state.

> johannes

