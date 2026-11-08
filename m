Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.225
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794168267;
	b=MW6BHKaexLEabSWdhQpwfGbWXvGViAx/+4hok4PF4Sl4id+calQETTjD+USj3l1g21X8
	 67drEr2xcpzkDBOSKvFsCEcc5rWBDlvuunFUSyCKVL1Zwhw3Lhbo73Nj0JFZKKOvPoDva
	 oR610CAknIyvXOzgiufLZzIP7ZUY3YuVEDyRjjSSIUv7iY+2uQ77hpHidAbUrHlhlpCiD
	 FV08+9GATzMy6qk+NAcVC3FhvsM8pA+KluKEFqFySzzaDib8aeeLZUGwHkY9VxVQiRnU3
	 FAFR4yFZB3cWAW5vtbcHBcrg03y9uFoUsKy6WhFopxW0200JEHt+jkqr2pyatYni+xg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794168267;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=NbbOOd4VdDMc30AN3UMYZMlHcE0axP2hcbh2KPSGNq8=;
	b=x1a6dfVJHU4D2AJi/OnVcCnibaRtGgHYM0kCGbXiii/Wx626Hf7G+fuDyOqepu5/9Oxe
	 oKcdgDQxsz8OhaYgE/cY/YT9UsdX0b7nVm69eCiv9GXO9iNTrHKjSfI3W+fDdJ+qbpNqb
	 SmVgGUEJlEPbW99AoDTBbyRfk9LMvNnOmN/4GNwzHuYdJwODLGjHnPQ1bK8OeDNCtf69/
	 1YIfeYZJHV77vEYb5iZscZqoA4crG1vpkgzu6lbNpIU5OF7Hk5d4I4SoZR0ZtpQQ1HYHc
	 qM7EUruoULGYr++S8R1/ZWGGCbqiMPi1Z1EJ5UaG7W677zv183dxNkDAsYb5X5gD1wQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=DiRiS0sX;
	arc=none smtp.remote-ip=209.85.222.225
Received: from mail-qk1-f225.google.com (mail-qk1-f225.google.com [209.85.222.225])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71E4B606A31C
	for <linux-wireless@vger.kernel.org>; Sun,  8 Nov 2026 20:04:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 71E4B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=DiRiS0sX
Received: by mail-qk1-f225.google.com with SMTP id af79cd13be357-93cbc3ab2fdso9644885a.3
        for <linux-wireless@vger.kernel.org>; Sun, 08 Nov 2026 12:04:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794168266; x=1794773066;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=NbbOOd4VdDMc30AN3UMYZMlHcE0axP2hcbh2KPSGNq8=;
        b=DIMZba5WSuocSUca+iD5waVLg2zA1287M/kFOK2oozhh7DXoXXTkoXFXemlL0TgDz+
         RZQpSFshobnxHyLUKO4w48XixBr8z7PBKgGI19I1PQMMUPU6uwwLyAzoF0Ocp18mtCs8
         lyvKIpOzjlPGp+NsgpiNoToJw9aVRm/GtmbIYVJ2K10bl4ECpHdkGr+xJzAlAwm11ftJ
         Z7i0TnPgZlZNvBPqu0UIbvOVyRScBiUiXsDYYca0bzO+WtKeSoen8ISSZiV8qbpxX3SG
         QYXs1ilxssvxbaT5YJqwZ+1e1qyQsVzpHfTuYIQUQtyrGefPl8OedyQVf51P2mKoeo7A
         6CIg==
X-Forwarded-Encrypted: i=1; AL+hErGu2xm0zFqmjDMUSfc9mbQs181MFhueI1Be3j/7F1G8JxiYxIYuB3e/M8x5ohZWnTrlVgqQ5dX8xeB2Gyt4LA==@vger.kernel.org
X-Gm-Message-State: APuU4Z/pv6JhbKkedK34lu/dIR503stn5Un5KAAl+DFV9m6b1DXBmy0f
	MF/x74J5Brm9PS7tUV7hKhLrUJQ5pu/rmHS6O3rthkJN8WQKEbZaMfY32Xn3FfN9/621skdMPiw
	doX/ucf2cy1rnInl0lsytm3kIzEprnLVFljb0/uL9rnHnHlV2ANkEFvEIHTYXsy1yE4MKjO6aEZ
	n/WixbDhWgmHr3tdDVNMeVMZdtyGihFI2/OHFSS9ixZg161OY1USPWNwUPAGBeaeUt7riPXdxFC
	9fRYoEhKpnIVb4hOhZMiKE5UxOs
X-Gm-Gg: AYBFou1QOIL13XjdHlIvx7wAE+jIV3Vm0azIXt/s0toZCfB3tzdCzd1FCAtQLp5qWUU
	dPRHsPn6H8UCRP1knAVuWaSEecrtP4bnWN1W5cpZGLLa9VDVTlCM9I0EhfCwFxX5cIA94HokRdY
	sieVGJ0kKnBFMcCN0GGZQQpzMAo2fHsoh+pcA8VE9pY6FXl96fc+gZkLKOOoYtNijiDBx/bGVnu
	afA4OVF63TVA/bPFA7TAB7KZzXaZHKZi4gQmG9grV6TP9FCXzXZeCSkg8Td4tl27geVzh9RPXkL
	8ebirnvmigLaGNN5VzZxHKRl5VUhyq286mVkcncvM4TxC7KGTfM5AG2NNUQMl1nq7VFKlZFeHWf
	SuYY1i4UYwF/1pn3RGQfa69+B2CLF40pl6l2MDPo8mganSXj6BO5n4OvX+pOjfM1mLLrRWfgbIs
	SwwUYr8oGS6Y/NvmmHmNpttapVKglCerxYKlW+GHQ=
X-Received: by 2002:a05:620a:4403:b0:93f:2236:a61 with SMTP id af79cd13be357-9478427ab26mr325320485a.61.1794168266297;
        Sun, 08 Nov 2026 12:04:26 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-17.dlp.protect.broadcom.com. [144.49.247.17])
        by smtp-relay.gmail.com with ESMTPS id af79cd13be357-94782d88d1esm23491785a.15.2026.11.08.12.04.25
        for <linux-wireless@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 08 Nov 2026 12:04:26 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1b0d864826cso1060451c88.1
        for <linux-wireless@vger.kernel.org>; Sun, 08 Nov 2026 12:04:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794168264; x=1794773064; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NbbOOd4VdDMc30AN3UMYZMlHcE0axP2hcbh2KPSGNq8=;
        b=DiRiS0sXRKHoMuNPPP/DuUBG9CXIBRjBt0F/Cyat4+I7fJTyhPdhdh22wuVuYyySZv
         fwQUGo+/EYPZXefbflO4zskRB//XpDEdp4CVZ+55aOIYKyjw1HGeHh5U1Z9+Aplb/qSb
         PVnHzONzS+RuKcLll1WCxMXH16bZ0WqrPnzVA=
X-Forwarded-Encrypted: i=1; AL+hErFWkZuTuAmmoahKwwpo+zobkmDaVe0Goi9F7Jq21mq7XQofzIt1miDlsxBBiJYbA7JTVwJ3e70L1DBDifZC5g==@vger.kernel.org
X-Received: by 2002:a05:7023:a44:b0:16c:4eef:a526 with SMTP id a92af1059eb24-1b39fece490mr3599290c88.15.1794168264433;
        Sun, 08 Nov 2026 12:04:24 -0800 (PST)
X-Received: by 2002:a05:7023:a44:b0:16c:4eef:a526 with SMTP id a92af1059eb24-1b39fece490mr3599233c88.15.1794168263698;
        Sun, 08 Nov 2026 12:04:23 -0800 (PST)
Received: from [192.168.178.26] (f215227.upc-f.chello.nl. [80.56.215.227])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b375603ee8sm7143895c88.9.2026.11.08.12.04.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Nov 2026 12:04:22 -0800 (PST)
Message-ID: <3c7e9eb3-b278-4208-901b-b21194e65914@broadcom.com>
Date: Sun, 8 Nov 2026 21:04:17 +0100
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
Subject: Re: [PATCH wireless-next] wifi: brcmsmac: remove unused wlc_info_dbg
 variable
To: Johannes Berg <johannes@sipsolutions.net>, linux-wireless@vger.kernel.org
Cc: Johannes Berg <johannes.berg@intel.com>
References: <20261103162709.8a0da8a7970c.Ic047db7b9f9a30522a8d0756c70b446003aec915@changeid>
Content-Language: en-US
From: Arend van Spriel <arend.vanspriel@broadcom.com>
In-Reply-To: <20261103162709.8a0da8a7970c.Ic047db7b9f9a30522a8d0756c70b446003aec915@changeid>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 03/11/2026 16:27, Johannes Berg wrote:
> From: Johannes Berg <johannes.berg@intel.com>
> 
> clang complains this is unused, and it really shouldn't
> exist as a global anyway. Remove it.

Right. Totally agree. Did git blame and hell yeah it bounced right back 
at me :-p

Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>

> Signed-off-by: Johannes Berg <johannes.berg@intel.com>
> ---
>   drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.c | 9 ---------
>   1 file changed, 9 deletions(-)
