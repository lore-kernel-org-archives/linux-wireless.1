Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.227
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794924304;
	b=px2BJU39lM8l0hgbfU1B5e4b7PuOju0GlaFEFh5+JZMMVb5M/Xu7WlFOsk9x3TNiQlbH
	 +YGekwZk8Klmjcxqpo9k43jUb6fXkBATce8N2OzFUMtg5MGZvZwy/R+rYrFQCPtmPUmTq
	 vPuFFgzDBFzokN2TUImx6V5UiOVuUpHxN/WsKktg2scgiGdG9p8pIfYiovUS5+A93kdt5
	 p/abhS4b1NJ/yhuur5cn8qodyHrzpEU2CI/T6ZTZlMQ00kjY4zSj0cyrMKrygvbj2Ww5e
	 7sJObo04g54+EGTuWrCwM4kcBCBSJLVehWrMzi+NWKi8ZIdB2pcjpBeJIuZ2R4BC1aQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794924304;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=o+yBsenDI2wUPc8JhBFdOyO8USU1Y1cTrtOmqBqpCOY=;
	b=Jkz6pqQtMiTI3pJTDVh7canDJsyfYFB51MUW01P6+HLZN18sZtjTJOsk5pATHMa7JILE
	 sGqHBCiGBk5QNxG5u0VRe+ZF8/gdZgtNnpuhSUORabaKvtBqKHSOgxyfRKtdl3zPSrkTl
	 DEdhPWqxlyFUQ+zPgLcvloxOIrIa/KM5XqRdOzDPL0wIYyxP+ddHMmqjF1z91LiQkYwkA
	 A7ksLiVR/a5Oo0sydwRGNo8w1YD38aW6puF+juPvrjd4wKD62bUMfseyeZ1e7Ho4P9i/C
	 8SPN++dGXYHsGrkQrxc9j4yWRhKe9F2H0CuqX6fPyrR2lvf/fOjNIkHw9lRsyYjzsIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=AWTwNaXE;
	arc=none smtp.remote-ip=209.85.215.227
Received: from mail-pg1-f227.google.com (mail-pg1-f227.google.com [209.85.215.227])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15FC4606A8A5
	for <linux-wireless@vger.kernel.org>; Tue, 17 Nov 2026 14:05:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 15FC4606A8A5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=AWTwNaXE
Received: by mail-pg1-f227.google.com with SMTP id 41be03b00d2f7-cdb15cd8558so1949906a12.2
        for <linux-wireless@vger.kernel.org>; Tue, 17 Nov 2026 06:05:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794924303; x=1795529103;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=o+yBsenDI2wUPc8JhBFdOyO8USU1Y1cTrtOmqBqpCOY=;
        b=cucjUmDGnGAE7Jq4NJQbx5yD/LVOrzkfxlQrAHDOeSjWENld+y4XnAuk/ifFqc0B74
         fMPHz1uvKuuyDa5dkIk1BmpqrQZ8crt4LYmZFwrd8ZUq0+o3Kd6RzSOMMy8X+UWaCxac
         51Y+/pgOT6L7CsNrQYqn4y5BMb9Zk7zn+mpPbOxX+CUT7z0Wi0NBjwcfJGVV8tGjT+mQ
         300zhtHLulrh/R9SsiccEvHz3irENwOr0FjsZs2sH412ej9Jcpq046rn6fbiiH57rzuE
         XGNY60piNev+iOniTbV8SEOnw26qb401qoEfyvbRH2OnfYUqsP6sYggN7uAHDbTh+u2P
         kaSQ==
X-Forwarded-Encrypted: i=1; AL+hErG+ePoL8Edqyc64QFAk3237Pe2pjF69MEnjIgo+zd9A4x/5MHz+NTj79nEiJRRCXQrIj1OcymZ79EfaOVIGMw==@vger.kernel.org
X-Gm-Message-State: APuU4Z+aXbPCb/YjxEyJEkVpdqvHyISM8NOu9gXMHK1P896VoBVQymld
	TaQaP+YokSye3yKEQ9QWB68CAEhVpBb3qhrP+xhXgHMc+0cbPft/OOHv8bGJ5TSKnn8ELEBIFRK
	42UYoX+N1JIK40LF2GLJBjG869lZtJaVmLY9XL0CQ36/Ki88rui8/Di6kjkEtnT1KBmHpwf4lmf
	EQ+EIPz14fQILQR5Hhn3YuE2D8svAXPoPIl71vjNb0p9E2XAichv7pT/CdgsXrIRO6jAEAncfLA
	rLs+2qdKYTTnhVmUDHADO/b7w==
X-Gm-Gg: AZFdTZfpqt2dROtuRzHE2m4dd2koEya5dCSxt6I1GUdU/KmgKL3TR85OtsnGV6cOebG
	cBHJYo1/JVI1fYSas+WqeEUSEsGeA7ZVu1aUUoEz3hlx4AjmH/RmroJkLs1UlwloyAS5pf2rq8r
	LQMZfro9IkG3CKkeQLLI3LHPl9FZHe8blGahs3EDrzrLVvLBYnI/kpYEdvTYmtKoCwlCDm3D2eZ
	e5uv7TpUrV144zXwzHeeW0ejfhNrzRlpUVb7XT5U4eHbFKO2uoJ4+chzy+szp0jrAecYeVeUguc
	2RFi9fWOXyIB07oEs4x6ow06uaAEdn3hGNd8e4xQNRh/W/LdlCmSkYHuEvrWXag1CRwVdXY+zak
	A5lVbCtruFeXzbdUKjWhUCToq2z4jc64Wrm/BwseB+zoJMLkQ3AO0oiCW4v7HF+1jZLGXA/SSXy
	XOdtzlbettOpwXJArxiRaoSNy4BMjiBYf9geoKF1I=
X-Received: by 2002:a17:90a:ec05:b0:3b0:c11a:902d with SMTP id 98e67ed59e1d1-3b1b09fac26mr9854386a91.10.1794924303071;
        Tue, 17 Nov 2026 06:05:03 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b1b3a71eb9sm7076704a91.4.2026.11.17.06.05.02
        for <linux-wireless@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 17 Nov 2026 06:05:03 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2eaf3f829b3so40150455ad.3
        for <linux-wireless@vger.kernel.org>; Tue, 17 Nov 2026 06:05:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794924297; x=1795529097; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o+yBsenDI2wUPc8JhBFdOyO8USU1Y1cTrtOmqBqpCOY=;
        b=AWTwNaXEjfwUkOqo6D6SHwLlHauaazz2eT1ha/I5TBu4UF6akWIqgHCSnoNAyNdYSc
         fx0MhOKJXiyIwYesfBBVEP/PPcmPt0n6Q72Ipt+K+fOJ1IW5OBdt3vNkfusemvZC+JTi
         gAUrb7o27vgblNcK0vByA6wJ6TtNZdZNi1zL0=
X-Forwarded-Encrypted: i=1; AL+hErHltwINgaal8unEJVfbpxhutHhP665j+wwBg3bzX8H9hPBsY9mJCYSSSEnWQb5rc6WgMmpUMwV3pqmy0UN9lg==@vger.kernel.org
X-Received: by 2002:a17:903:22ce:b0:2df:a4d8:57ad with SMTP id d9443c01a7336-2ee0dcdaa1emr123674975ad.72.1794924297105;
        Tue, 17 Nov 2026 06:04:57 -0800 (PST)
X-Received: by 2002:a17:903:22ce:b0:2df:a4d8:57ad with SMTP id d9443c01a7336-2ee0dcdaa1emr123674805ad.72.1794924296646;
        Tue, 17 Nov 2026 06:04:56 -0800 (PST)
Received: from [10.176.3.187] ([192.19.176.250])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2efd76db218sm16492325ad.3.2026.11.17.06.04.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 06:04:55 -0800 (PST)
Message-ID: <b4ef6564-0e96-43b3-8784-57543ccf8ce7@broadcom.com>
Date: Tue, 17 Nov 2026 15:04:52 +0100
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
Subject: Re: [PATCH wireless 1/2] wifi: brcmfmac: zero-pad SDIO write to
 4-byte boundary
To: Tristan Madani <tristmd@gmail.com>, linux-wireless@vger.kernel.org
Cc: brcm80211@lists.linux.dev, brcm80211-dev-list.pdl@broadcom.com,
 fariyaf@gmail.com, linville@tuxdriver.com, kvalo@kernel.org,
 linux-kernel@vger.kernel.org, Tristan Madani <tristan@talencesecurity.com>,
 stable@vger.kernel.org
References: <20261102122311.181075-1-tristmd@gmail.com>
 <20261102122311.181075-2-tristmd@gmail.com>
Content-Language: en-US
From: Arend van Spriel <arend.vanspriel@broadcom.com>
In-Reply-To: <20261102122311.181075-2-tristmd@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 02/11/2026 13:23, Tristan Madani wrote:
> From: Tristan Madani <tristan@talencesecurity.com>
> 
> brcmf_sdiod_skbuff_write() rounds skb->len up to the next 4-byte
> boundary and passes the larger size to sdio_memcpy_toio().  The 1-3
> extra bytes come from heap memory past skb->data, leaking stale kernel
> data to the wireless device.
> 
> Zero-fill the padding before the SDIO write.
> 
> Fixes: 8f13c87ccc49 ("brcmfmac: Split brcmf_sdiod_buffrw function up.")
> Cc: stable@vger.kernel.org

Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>

> Signed-off-by: Tristan Madani <tristan@talencesecurity.com>
> ---
>   drivers/net/wireless/broadcom/brcm80211/brcmfmac/bcmsdh.c | 3 +++
>   1 file changed, 3 insertions(+)
