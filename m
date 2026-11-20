Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795139641;
	b=bSfPNhkIbByIlio+OQe3GvT2uGTthN4WxiDdqw+vqrVL+qIFIc51Sy6XhMkXbXNwQdyN
	 CbGtFmF5VtM5DOGtb7JXmM81ZCbrBQigNKW23SoSx8uUYo/du5DyLwrE4EIpiewXGf6Rl
	 f87rZvicvw49d5ics6eb5FeGMPm6L2RfpejlAlFv6mO0OJCsZDg47i4wZVYIjrwvH9yuj
	 EEJtjNjeI+WV+Tzy4/fnIkVw9uOkip1sjLcKKcGtA4ciIFIarLX0E6ywZJU3CYuSuY40S
	 bkuaPvlkoY5pysc2sRVZPoCtbBkfItqWmfRH6xj407tJt0oYUys2GFA3G9vI7oyoySA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795139641;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=kOnWu1aN9TGcSWi9/ZeMgVx7wWAkZHh4LA9WwHHGP8k=;
	b=jWDfYcWvelyMdPtri27XzROw5ABIO8lmuVnBP1Nir0FEIN5DOydrrdy/cfNM4QzUZNej
	 cilZeh/v2h6uKczDSb/E5tvqDKOtnSEv77VCIImIx2G2lgY1ZxVL521CIw7ZWwF1/bt4N
	 ngNfuRJat3geJH3PvTU0Cmmgn5uecFbXsS6BriP5/4b+wsRDUJVpBc1Kdowivx/Iz2AcA
	 LZbL7EkoT1dAfCGeXiXTXh5OBew0Zu+0YBRGQ3IcPeepKBdr8BzP9JWtkrX5dL7hpOyxj
	 a0sc8y8W+rV7zbxIaEhjljsbEdz9LSh3/ADFQgCF7aAgKb8cHkbm/ykeaNvOlWtSshQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bW+d35Do;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A29A1606A325
	for <linux-wireless@vger.kernel.org>; Fri, 20 Nov 2026 01:54:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A29A1606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bW+d35Do
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4bb6ba3b244so2816065e9.3
        for <linux-wireless@vger.kernel.org>; Thu, 19 Nov 2026 17:54:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795139639; x=1795744439; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kOnWu1aN9TGcSWi9/ZeMgVx7wWAkZHh4LA9WwHHGP8k=;
        b=bW+d35DoAlW/rKmk9f0ouEm9BUqIBf4HY54DatgUctk0mQgpJyYjRNVHOn2PkL+oct
         T92i9FMrcnWW3yZ177XCAMgqCg53//z5338q80jULE4bjhMRIGY57DJsJ0bUQAMuU16J
         sLeInY4sO4Rd0QKB5cO+Rhl0CpyX3GgJIf2TXMgAmxp+nvKmzwXPkDv9nlP648k7wM18
         zp9nmI00kt3vgqr739RWeEPjSmCiwVZ3G0VlNpuOkdSCxUh62JiFKTzllKv2aOZsc51u
         I2u2vlz53BKaM7l0YaBYqN53DHnDQeUIoAObqP9N8RyVuwbqdXeN4o/gznJqC7Od2nHy
         I2UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795139639; x=1795744439;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kOnWu1aN9TGcSWi9/ZeMgVx7wWAkZHh4LA9WwHHGP8k=;
        b=KDx+jX4LTdwLhBrC8NxMFPSoyAr3mVeSjqgcGDoKWEcbwlpIQWIVj/6CCQvXRUaVGD
         zO78ZDETJI4cOuAErkCi6QVXLBCmAeHj8kgxItq4yCShjgNaaoIHaT82rsxaso2YzOp9
         sG7ILsnudbQGnnHxFGy/i7BpIw9JiLqfcxfpVkR/pg0+vJR5MvFh6rBuFx2FrcRgo4Yh
         oHnlH/UctPJe0hULMr8T7pkn4v7Qgo5qwezybdDg2yq9Vm59Dpxt4givxmTwiskmc4D5
         c9H0TlE8yEyohMiojlDvQj4a2O1nOXlFTEdAVKdmYAX+Iap7LvIgoeSRcSqYNgfBmzkv
         4Fgg==
X-Forwarded-Encrypted: i=1; AL+hErEAgum98SrufxHfk0huoU9gglVJZNKJBdhA+lU6TaV+u/OTH0QCS2e/7nso0Q3KsxkbVny9jThJKw7umoCaIg==@vger.kernel.org
X-Gm-Message-State: APuU4Z8jvHjs9qWno16atjid4UMlCyYYTzjlV+Hi71mquHkzQb1O8dzs
	muaOnVbJ+KXNyb/5EQALZndoC1vzrjsuXMR+uRF9IUXG8MRUAASCsmsj
X-Gm-Gg: AYBFou2c0x3BPxYjL9YJyJMrZzl90ofiEnaIIkM0TB2MdHMg1bRRasfoKb8jQQadxU2
	dCbuTtbjh2PTrniqCSiO5G8YnNMb8Ivr2O/bsHzZAFa5hvO0A4WiVvbIia8JN3iMQKO9FQwL6mE
	NWooM/+206HrZJmyuxmHsTzkqaBXD1GQw5zp8mYa28+R7hd+yzdMOXmHjoOtlxHKxPFy9bhn90x
	LstFDjgzkZ1ngK0ncoKNUNIzF3eK0dZ+Rb8wl5CpOVkwRvfCd16ec7BB+lrVkIf1I4/IdElmQqk
	edYk1ZXr2ZbPIZvCg4gp3nsAdLY3pjoVfZYpq9zFz2W5jhayoPwA9MwX20J2TpLECma87mEsNkx
	1DSSyVKNN3GJa8774Y36Ladjet/nSjhQEks7B0y32y01dN8cYnO7e6dgATy+Utvbs2QXHon8xBR
	FTag4SuZ7zuhfJFfuLjyypby6XH0NtRlYZRLY0pvXMp9Y/9hshcntW3V756HO1xhT/oIx8Xcrq0
	b09SM1e0x83QX7NCi7HBqllzxnjZ1U1dvyfaYBvIUzZqC+JC+VBcfDo0T33ZC1jibESlndmT5JT
	Q3VUFVfyFY8qfWrVSzw8apfqITEpffNExuEMpI3oUREkFY5vk9raDPt7wVrJkaijYD/CNpVBIIl
	TFJyq6nbdNSKT3XSVm/JZ/GRb5m8N0sej4A==
X-Received: by 2002:a05:600c:3547:b0:4a2:a6e:80f5 with SMTP id 5b1f17b1804b1-4bb888098bfmr27066965e9.11.1795139638870;
        Thu, 19 Nov 2026 17:53:58 -0800 (PST)
Received: from ?IPV6:2a0a:8380:3:1200:fa63:a6ff:36f3:e303? ([2a0a:8380:3:1200:fa63:a6ff:36f3:e303])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b10b1ebsm2632311f8f.33.2026.11.19.17.53.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Nov 2026 17:53:58 -0800 (PST)
Message-ID: <c8655908-78d1-4a4d-85b5-f3ac3aa49b5d@gmail.com>
Date: Fri, 20 Nov 2026 02:53:57 +0100
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
Subject: Re: [PATCH wireless] wifi: mac80211: apply ap_isolate to AP_VLAN
 stations
To: Christopher Hill <ch6574@gmail.com>
Cc: Johannes Berg <johannes@sipsolutions.net>, linux-wireless@vger.kernel.org
References: <20E87267-920A-4FD9-9443-050AE7676E45@gmail.com>
 <20261107035220.50480-1-ch6574@gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Miroslav_R=C3=BDzek?= <miroslav.ryzek@gmail.com>
In-Reply-To: <20261107035220.50480-1-ch6574@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Tested on MT7981 (mt76) with OpenWrt 25.12.6 / backports 6.18.55, 
stations assigned to AP_VLANs via wpa_psk_file. Same results as in your 
notes: without the patch stations of the same AP_VLAN reach each other 
regardless of hairpin, with it they are isolated when hairpin is off.

Tested-by: Miroslav Rýzek <miroslav.ryzek@gmail.com>
