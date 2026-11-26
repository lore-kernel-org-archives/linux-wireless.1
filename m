Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795680990;
	b=DB06pRvHqNmLcYIqJeCEMKMpqqCT7qQJzBloVAs0pq9eLg8oogFwU/+7woggSPpT0H/Z
	 85nrwm5jkQDqMxB5F8thxnPOUD3/dTpP6xEeOYSIy7bJFHpitdeJwvwxtDKQz1sLO1vB2
	 GxPz3y1pTZCJffXBVOMqQKJFrzgHnyyHIsLM3F6ET33kHzNlCLYxVDy8fSzr88/ojSsD8
	 lfCHdG//Ugtj1m02RdVhGWIRtxSSjCdhIJg7qHzHgL48TsZ2KtlnyYxKdlFTU5Df3AV2z
	 w2VFGWCEUoVpxBdh9eDoR5/bFUZ1i0kSNonpjohTemKjCu3c7d289AxQ/njEc73x+AQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795680990;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=2hMqRpK1MgAk6PiKz4K8A/o73UtnqzeUiIYqjDgbKrk=;
	b=vq3hvvWGqlyYx2aiTsKpzMROvYPaoSnc8KoTngY+MaWCNMrz91cX4pTTTEOGgJ5UbkoN
	 mRY46TZwmWckd90aCH0CIvhpNTKrcu0dAW2LTFaVrSoU8r07x1qL/elIqKvIPnSEJXFcj
	 sTLxb+9wzaGytTwAT9yn3VbVjLxyeqKgepwio1BZVfIhcJj9xzQ+uMO81yo0z8E1UncLy
	 +y0q3Dx9VIfnfmLEuicgB5jazKi7RcwJtKq/QeyKvSm6obfPlirpfEWD7gCTA/toTRS7l
	 2LucaIvAJtIU2IdSaJWJ1O0PU9JRE1vcKneeIlUXYubkTACVUxZhc/Cm9vRfUWvOnEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=B9Y1lsMK;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=i8KcTdgE;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41430606A31C
	for <linux-wireless@vger.kernel.org>; Thu, 26 Nov 2026 08:16:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41430606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=B9Y1lsMK;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=i8KcTdgE
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ7B4Da2595120
	for <linux-wireless@vger.kernel.org>; Thu, 26 Nov 2026 08:16:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2hMqRpK1MgAk6PiKz4K8A/o73UtnqzeUiIYqjDgbKrk=; b=B9Y1lsMKHwnmyDqV
	Qocphua3FpMjdRo3xNMKZbL5Df9gZ+Zlo6R3IwOAxBszc/Mu2lH60OagkIzpsoFa
	Ay72Rvv4fvpENox6mW8KaETEcGg7bjpMMc9bue9Nt37A+r2tBHL2Xoy4gqHzzxzT
	J0qJFpuE08d1NmgqkUGcUGUU5KN9vKLPXYNrAj3yFCfsGyCI/Gdnf1C8r5hAV4ld
	aXrzVzoLitLT75NsXG/6QYVc8RJenjq/GFhqD9bvTIwB1k/doBQDM5Vgr5IPnMYY
	rVaieTzvNYI4Wn+0+ajvv8Nl0I5IvyqUvNqVCc4oj2NbW9wboYaPuGqT7BDtJmVv
	9bV9Cw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j662sa4y3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Thu, 26 Nov 2026 08:16:29 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3b41333cb47so5710453a91.0
        for <linux-wireless@vger.kernel.org>; Thu, 26 Nov 2026 00:16:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795680989; x=1796285789; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2hMqRpK1MgAk6PiKz4K8A/o73UtnqzeUiIYqjDgbKrk=;
        b=i8KcTdgECKcZzHNHW/beS0KU5TawZrHvX9TBc4VNoYRAUXhVjFFxcgytOqYexMPn/Z
         26Nz/ECOWxSvjifTVXh/6W5/R50LQ9lwwSbfT6/evtvGcWhvWrZ94Z/X0WhQEZtA8z0H
         R7UMWclXyR1cMaow/ipuOYXTuD5M6DWjDWL2XhkrWppsKbAB3NUfnVUdr5t9WPbj3WsK
         YzJZUCXY0deoS6srVyI21EDVYlazO9sdHBIwn8KkMuJnEoRHlPL3yNDyjv74iMdyjkgN
         0ItfJwYbsBQDYJKdv7pz32Zvf+RJOvuHKt4goZlUImtLhFoiEXx7mKKNaV959S2npvrr
         mYLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795680989; x=1796285789;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2hMqRpK1MgAk6PiKz4K8A/o73UtnqzeUiIYqjDgbKrk=;
        b=b6j7cvXTwvzhx8e+3CKN8OIvMWZffCIW3QGM3zr9gXRIvf3NMkXhATP/tDoRa8gYiR
         g1faKXjiXzF1F6Oa1NA6UPiu2wPFSKHvw0O22JsfssGq1t68g0HOOkF/qrZTW7EaKhXC
         uaYJ7QqUll7Xehdueet0muqnMnOQ9u+ZDWljm+aNmKlI0wkmAnKtgldvy8pNhx7qd+7e
         utyhhh7CsRKkqMIzdI5sQ0DX5Wv9zPhn5szfvTcs/ujXvGQgsKETcIyjkRQYzuUvkNpV
         ++RhBQkbo+0ZaqQ3buk4/mtv3N1PvfU4O6L8ENX1kMbXFWfvnZNe1ZkBGsilT1oJnMIz
         P9aw==
X-Forwarded-Encrypted: i=1; AL+hErEnMiCYNzSs6X4xDlImNFlshOZXwiXAWA4bYA6ubPr6lEwE3VwW6Qnj3b6rvhYLrF6WQB0S/AbRvhpQKuq92g==@vger.kernel.org
X-Gm-Message-State: APuU4Z+O7v2/65lnjIyDUYdVbnH6KAWuhIJQNsahKSEc1gpWdVKUxrf8
	IbuVhbUEHdVLXx4eezPEsZRCBtTYQvtIQJQskqgDJvx+6eraed5t5iq9razoeTfsO/JbEX6TyP3
	rmJCdjlWqfS+/5l/WcfZ0YRd0LINbJVFQkSN2izciY6TgLNXFSnw5yRwvELActHg4QzNKHQ==
X-Gm-Gg: AZFdTZdTNHlwoo7dMNGdhAdBWQHgVrSeJENCHcahTj6GvoIV/njBXe8j45bxEFXeTC+
	ZL3j/niZwK8e1bV0A+3NyNPulDnnR2Pue+MxsUtIm81kENZ0cn/y/8xRQXkf/S3Ae4t1F/Zy48b
	368oziGyF88hqZoCq9Y4Cb3VoCO8goYrUDE7fyXlSIfIHyKeiUoSAjNHo9P1ZErJ8MHqEHbeg0I
	QBA2V2TV52wUTCcZzS/iSe1jKhrZwMG0kzN4vCHevXS6g1mbQGo3fC2y6CtFP71X8R8Zv+Eb4IG
	ojx8wfX1GmqTf5ZlwECfBlaMu6DPaTgM6ZLXpLXmDBehU0IKgn0LATn/mxkBVKp6iG9tBbyWgog
	QNQGvueHDrRcln4McJiN9cZIZP0XsuUbq8JSpNZzOea2u5Sc8ieO7gQZRbXya042ZcEK8b9JII6
	hAh+pq
X-Received: by 2002:a17:90a:c10e:b0:3b0:ada3:b505 with SMTP id 98e67ed59e1d1-3b41c8fe1d6mr20875753a91.19.1795680988399;
        Thu, 26 Nov 2026 00:16:28 -0800 (PST)
X-Received: by 2002:a17:90a:c10e:b0:3b0:ada3:b505 with SMTP id 98e67ed59e1d1-3b41c8fe1d6mr20875722a91.19.1795680987817;
        Thu, 26 Nov 2026 00:16:27 -0800 (PST)
Received: from [10.239.104.253] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b4dfbe54a2sm10713182a91.17.2026.11.26.00.16.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 00:16:27 -0800 (PST)
Message-ID: <5e83a95f-72fc-4a5c-877a-9238f76df192@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 16:16:23 +0800
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
Subject: Re: [PATCH ath-next v4 01/10] wifi: ath10k: fix SDIO aux workqueue
 starvation in recovery detection
To: Kang Yang <kang.yang@oss.qualcomm.com>,
        Jeff Johnson
 <jjohnson@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20261120-recovery-v4-v4-0-53d6a04490e0@oss.qualcomm.com>
 <20261120-recovery-v4-v4-1-53d6a04490e0@oss.qualcomm.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261120-recovery-v4-v4-1-53d6a04490e0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=B54sQ+tM c=1 sm=1 tr=0 ts=6b07eadd cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=KKR0-_iPvwzX1PQTlCgA:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: aXSnEkbl8Ptvf5X3Q-5va6aLqR92OHto
X-Proofpoint-ORIG-GUID: aXSnEkbl8Ptvf5X3Q-5va6aLqR92OHto
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAzMSBTYWx0ZWRfX4T52hIrlyHV0
 82dKmYnpM6Oo0DbKR+QcaeWVozNliU3dv7AAWYwzef1ypslOuVzCp6PmyJ/Utr1GGjD7PVHxNU/
 P0h+9JuReaMpMCEwaF5xjZE20FmQyPsBCgq6AOfwK4pzqezxIQKRIY0b9DsLCNxHtE8hySeHDCx
 u8tyON62xfDpq995Ra7aaIwyjMqRqU6iDZSdieIncsTXzFCS+C6LYv2DeGZhshTtMcgZXkLCr2k
 Q0k1Tj7THPxNIJodFJfyKilyojMTDs6NdIeOVRcD/eeq8Uzf7th/z3hg19NFk7ki0yfxiTXj50n
 jVkWvIGO6Q0//aWV7d7v5qgH6jTwzLxOdFb6HjbRJOfoHO5QgGXM6t8f2YmT4u2SGtDRs+NO/1o
 PzMaDmaD+iUaTrIwDZp55ivQLKQ/ikMtJjfoxeVAgZ8VWodjFo5NU4Kk841LrKZYDeybguHk/dB
 AbR6AvG4TH7PBOuMveg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAzMSBTYWx0ZWRfX+EDyRi+Lwbm2
 +1NM17y4HRurwKoFAlcmHA+sbZvba1CWgrUhLlYA1MJNA+JNK0RzsTDgNBaAaf9aKZvlOiwaJDn
 0EpNCkhvWNjLkV5WVZvjebZ1LEubYyA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 phishscore=0 clxscore=1015 malwarescore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260031



On 11/20/2026 4:41 PM, Kang Yang wrote:

> @@ -8170,9 +8177,13 @@ static void ath10k_reconfig_complete(struct ieee80211_hw *hw,
>  		ar->state = ATH10K_STATE_ON;
>  		ieee80211_wake_queues(ar->hw);
>  
> +		/* Cancel the deadline monitor first so it cannot declare the
> +		 * device wedged after recovery has completed.
> +		 */
> +		cancel_delayed_work_sync(&ar->recovery_check_work);

If recovery monitor runs between "state = ON" and the cancel. It then wedges a device that
has just recovered. The sync cancel only waits for it to finish, after which
pending_recovery is cleared while the state stays WEDGED.

would be better to move cancel_delayed_work_sync() and the pending_recovery reset in front
of the `ar->state == ATH10K_STATE_RESTARTED` check? Then either the monitor has already
run and the check fails, or it is cancelled and can no longer race with the transition to ON.

> +
>  		/* Clear recovery state. */
>  		complete(&ar->driver_recovery);
> -		atomic_set(&ar->fail_cont_count, 0);
>  		atomic_set(&ar->pending_recovery, 0);
>  
>  		if (ar->hw_params.hw_restart_disconnect) {
> 

