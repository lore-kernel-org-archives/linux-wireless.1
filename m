Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.99
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794999760;
	b=0OYLW1jVkgx/5N5eAqouiQthtrLUR1+uJ+zraKWdCb8j9V8W4HlUnjVUOy4oxEH47Ou1
	 6dDfN6i8dkCxAvt8AP8vDBv1oXJqDR6o7IajVJxjzABtOimBLCFdi44m2dUDOx7NwpS7n
	 YktnyRNkoBE5/wCc+r0yvxRsfiTvd/g1hki1/cJA7k5AjLbJ+51HDv9n+soYf0GyS7PFP
	 iebkZh0n3BtFLqwo8hwOo+eGX/zrJZ5PHJW6LhDoDohFw96Ir8MMGraGnIYvwI5QcDsao
	 4CTz7IGsULu24/Rzln0KQ1ieNvjKoDk751pjaPyEQPsNOhRY89pT8ndPuXk++eGZpVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794999760;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
	 DKIM-Signature:X-Received:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=c0vVjUXXO3H9pY7FsP7IBiUJJTrq9KJzbI8Ty+f7k3k=;
	b=viaoGECWodyDjcbEtN3V4WtwDnlng5f74NXkiihYPXhHO4V+hfbdXcdDu3dWKoFJQq3E
	 lisxLrfo/+WTLy+YKN0bu81yMHQCx1hb4rTOHGc6+zm7FuhP/msMD+gZqBYNpaaRrLnFp
	 e33shiAtoEtq/WhN+UiSFout7Dnd4QHYrAorSOkvaJdAqtKT4SUIiKcQltOZrXzRGeLdh
	 tLwRIglyXHFwxVKlR2W3yGNinUgADICiTzugsJdbnAtZcfQW4vUu1GtOzLRRA9skLFEEd
	 tAwJR7vqL7PRP7TgmUd273vE1Ct6xmJvTpL2qIytkBrhEYlLoXidWmVoGu1P4KUj4ZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=CEw7PMfg;
	arc=none smtp.remote-ip=209.85.216.99
Received: from mail-pj1-f99.google.com (mail-pj1-f99.google.com [209.85.216.99])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45639606A339
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 11:02:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 45639606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=CEw7PMfg
Received: by mail-pj1-f99.google.com with SMTP id 98e67ed59e1d1-3ac78f4c10bso444014a91.1
        for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 03:02:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794999759; x=1795604559;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=c0vVjUXXO3H9pY7FsP7IBiUJJTrq9KJzbI8Ty+f7k3k=;
        b=le5X07Wtw8vOInJP2Bdl2/RQ+XX29u2pZKbVVzECCTHjX8kyxHQ93cDv/lUWelpnN+
         UBEDqrGOapYPLfwkkT6MxmepbqyM8NpbgG8mYuXZZ5oEJP3bVJTlvJC3a84hnEmmhuw+
         rtkJ5KfJixC5L8JEg0ENeXqzCYt2OaZfZ6R08AFmTdHo3QOVajcLAO+WlVEkhqxPY4XR
         5hLD0pCeMLjy+IMajo6d8pA0lK4plSm70rvXqWIotnE/yOrlgqdDVVA+nlkWzB/AMa0Q
         megN3thVaBy/qUPvHzuNanifF1bPxAP2OFE2R/pqtWEjZzATbnn9KUUesl67liVHrOhP
         XiiA==
X-Gm-Message-State: APuU4Z+s9EaTeBdOAU5lsjul+m2oa3C4+sTu9NmNO8hkN6WGoOSUiIT/
	mP/4sIlF6b5zPulNkx3sdiQ9oJXf/FgfAQj8bqZWEeT28fyDxSLORumXjtoYPHfQBG25sCvUc93
	2Fqs0Lonho9H23he5d8nMjUTodQNHT7PZepGSfKFR1pWArmjnPcGx+zvG4gjjbH4NCCU48IDBkI
	RzcehGIgzNXHeHn7JW8+ZEIwom8FDBhQZvMbgb1XS6nZgA170kZ2AHd9uWoqfSMRvYYfqozFxxT
	dBC1ppbkJNNzJZxklR5Afa5+MUt
X-Gm-Gg: AZFdTZcouW1pAD+cZDNtXwDGuRapqmDm9Esz/2JSXBTlkKnWRDd2vyR5SZDnLsUV+Hb
	YEHgGZTFm3vn622fQHiEmH+s208OG6f+YSaJMR6a+bT1NRzCWJMhvtFBOqwKMfNtMSULTbpGh62
	JuVtNXzF8FH1HA7BIs7+LQ3sXMkAXoq06ZZKdmhDKjvmHzUv/M3uGnVGdnX3jBxpqC83n/pDmYQ
	KZrGzQJBuWk47SFxKA4vobQfRfPCQltAPK6AQenlZzLRvGXiVe7Y8sdMIZJosYN85N7Q6G63T22
	cmLP4I/ldwxtMIWXnHGRKgsuWJUe82kpUr/ZJ4U5Ctrq+5vN87hQ0JHqNq3AnX0f/RnpYzNSVTo
	a6R1UuEtWypYY3KBPcc8kkGZUFYpJRTWzejshJup4MGNTp0peZzWkfnpLYzBoae+5aCriHTKmZ7
	BetKbQrMP9G4xVP/0rDewaF7lTxjUT0ZSd6le/VVattg==
X-Received: by 2002:a17:90b:180c:b0:3aa:f2c4:12e9 with SMTP id 98e67ed59e1d1-3b3d06a3a73mr2491271a91.3.1794999759430;
        Wed, 18 Nov 2026 03:02:39 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-123.dlp.protect.broadcom.com. [144.49.247.123])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b3d1d8dc62sm727735a91.1.2026.11.18.03.02.37
        for <linux-wireless@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 18 Nov 2026 03:02:39 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-92105a68062so19097196d6.3
        for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 03:02:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794999757; x=1795604557; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c0vVjUXXO3H9pY7FsP7IBiUJJTrq9KJzbI8Ty+f7k3k=;
        b=CEw7PMfgdtYDPQpB+ibtcPkFyskPPJenIouEZszsEMfq+0uDoA/cnprYQjHW5awypw
         mQJbSGUW47CnFtpakgNfdJf+H+FO7Mnv37pA6qIQyeQ6CP9nZi8CNgnah3gF/ONQcu0V
         3uEl7wmz9hxz93foYKEHptwPdHfBpV3DLH2Qk=
X-Received: by 2002:a05:6214:3bc1:b0:912:517b:20e2 with SMTP id 6a1803df08f44-92114f76116mr33702726d6.42.1794999756785;
        Wed, 18 Nov 2026 03:02:36 -0800 (PST)
X-Received: by 2002:a05:6214:3bc1:b0:912:517b:20e2 with SMTP id 6a1803df08f44-92114f76116mr33702066d6.42.1794999756158;
        Wed, 18 Nov 2026 03:02:36 -0800 (PST)
Received: from [10.176.2.72] ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-921167f4725sm14267446d6.44.2026.11.18.03.02.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 03:02:35 -0800 (PST)
Message-ID: <bbc2eef7-e2a6-4f26-ae9a-f69caf3378ed@broadcom.com>
Date: Wed, 18 Nov 2026 12:02:35 +0100
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
Subject: Re: [PATCH] wifi: brcmfmac: Replace strlcat() with snprintf() in
 brcmf_fw_alloc_request()
To: Ping-Ke Shih <pkshih@realtek.com>,
 Mariia Nikitash <nikitash.mariiaw@gmail.com>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
 "brcm80211@lists.linux.dev" <brcm80211@lists.linux.dev>,
 "brcm80211-dev-list.pdl@broadcom.com" <brcm80211-dev-list.pdl@broadcom.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "morbo@google.com" <morbo@google.com>, "kees@kernel.org" <kees@kernel.org>,
 "justinstitt@google.com" <justinstitt@google.com>,
 "codemender-patching+linux@google.com" <codemender-patching+linux@google.com>
References: <20261014005553.71803-1-nikitash.mariiaw@gmail.com>
 <20261117133150.817227-1-arend.vanspriel@broadcom.com>
 <670492ee188945f8a3a3b147ae5b840d@realtek.com>
Content-Language: en-US
From: Arend van Spriel <arend.vanspriel@broadcom.com>
In-Reply-To: <670492ee188945f8a3a3b147ae5b840d@realtek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e



On 18/11/2026 03:32, Ping-Ke Shih wrote:
>> The Assisted-by: tag shows this change was produced with an LLM. Please
>> follow the guidelines in Documentation/process/generated-content.rst so
>> it is clear what was tool generated and what tool and/or LLM was used.
> 
> FYI. The Assisted-by is removed by:
> 
> 1e035297ffda ("docs: remove Assisted-by references")

Right. It is however appreciated to be transparent about the use of 
generative tools in commit message and/or change log.

Regards,
Arend

