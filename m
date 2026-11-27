Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795786410;
	b=iWjE8eLcDft5ulwAqbk4EX6i3r2+lM/TL/BaKZB432T5I501ntcvTI+D6mVI/3gE5LTd
	 NBaG6ZUx7WH3iZkSY1BO33WO5IOdGtMtRKoz30Rvnniq6MF0QHKsg/u4KDiI5OsZTFgPU
	 cqQWagG9z82uDvyF/3yFgu/7NNhe3EeOZ80qSHqhlss0qtjhc+ITkSDMoDEPOGRkYtueU
	 Reisnr+5ZIjyAVvVVxN++43gQKh42q9Yg9OkGYulSlaXTEry1i7A8VfzRJ2U50p/PlZ48
	 zcvWcwOLAV8NxDpDrmH7lEDOr9UojXBWVoEF3LYSv2yu4w0OGYXBCrhKc+ao79P7UEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795786410;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:To:Cc:References:Subject:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=fkhXrSoo6SmjstzLtiB9ByiPrCU8LhrgRp55NAhAc8g=;
	b=iuzu+L/PUQT2D0csMt62DzzallSJfy9GF4NDDfHPVWSjTECneyh9ijMvW++3ZHPv7xrK
	 jqkwUhoOnxglbdERVzPDvdtAAMOeSeG3exI5AJIfom6/+0b10aM8gsxpYRojBY6LfmydT
	 ZnTB4v69jXKXTVtXsmmjQLQ4VfXu+6YlxVgV0jm3cEr+eoe1xiPqyAPJiRjql+DpybfWi
	 lLkYTEu8jbwjtfw6oXNKrORbeKfybFW0l5oYLadg0jysyIaqov98lmuQQxxtGcofpv5hS
	 /Hjn6I+rBxNdk4C1V4n/qcskPO8iZKVA1c3yKRm8CRgK4Wtk4JzaerA7S2srO7ZGNsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=8devices.com;
	spf=pass smtp.mailfrom=8devices.com;
	dkim=pass header.d=8devices.com header.i=@8devices.com header.a=rsa-sha256 header.s=8devices header.b=dR0PWucF;
	arc=none smtp.remote-ip=209.85.218.51
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD4C5606A326
	for <linux-wireless@vger.kernel.org>; Fri, 27 Nov 2026 13:33:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CD4C5606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=8devices.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8devices.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=8devices.com header.i=@8devices.com header.a=rsa-sha256 header.s=8devices header.b=dR0PWucF
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c4322d310e7so373352366b.0
        for <linux-wireless@vger.kernel.org>; Fri, 27 Nov 2026 05:33:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=8devices.com; s=8devices; t=1795786408; x=1796391208; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:subject:references:cc:to:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fkhXrSoo6SmjstzLtiB9ByiPrCU8LhrgRp55NAhAc8g=;
        b=dR0PWucFsYZAI9qBLe467c+LEnAv1BrRw8UK817Irpf1RdXoUO2IVCwnuhh/jiWYh8
         wmyJfbUuT4EiYNuktw5XdgGEOyu2gpu4mcoV67h2zWx5hlPgIE5F4IQnMGf9/KdGUp/s
         PZZj2glwPcMmiVLPeSwM3VeRz7YICNNDqxroUP0YYBoYKBrzYGtELPEgjb3aoOC/74Ng
         MtC5oxYBO9KhJMUB6nBYDx+wzTca2zx8D0MRgPC/HFFtQZS4ALbvX0XZBuw9skqa/93P
         9/X2WpFnsE5BlUZPi2uil09DCoxlzWAtK6JwobQflhXaAchARk+D7L+IE806ryDynvHL
         W3gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795786408; x=1796391208;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:subject:references:cc:to:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fkhXrSoo6SmjstzLtiB9ByiPrCU8LhrgRp55NAhAc8g=;
        b=YgCqzx903bVs5D6bKg7vz4F4OJVtQgYIRL/wcpdvQdvqVD/9fLmdFIAqta1wgNT24T
         mpdJiBAiq5yWi956URdwQS4JfasvR9wtQShsqgA842h1z/YxeYn2NWnRzk6tvc79YPC2
         LqEc9JCZEvaJwlQmMS3tKK+8fONXewO2MIGi5voC065PxfJtGFYSG7RYWlDHOtqdQqm0
         YhTOGcSeA5N34/fqDH/08ZML+mZeeYLtoMZUCf/AooaUSGwQbzWjg3lfK801X9AxOOUN
         eC7nH/iRn/ojl3bAKNltG5AhkGUWoJlk/X101QQxZQ84rhhQz9P4XrMz6G4Rq+UpC3Ui
         SCsg==
X-Forwarded-Encrypted: i=1; AL+hErEKm5yEuB559DKOYVBcoxj4ja8juWQdV+AYBSsWaH6bVshbTQU3VMoT55DTh4IsbJBVETQ/Ykj/ksVT2yB+Ww==@vger.kernel.org
X-Gm-Message-State: APuU4Z8pHWNNwV5FQutHeH0ZE5wCkYRQ1+w2D3YGo+B35DDgKQXsXhGg
	LLEJnnRJh0tIB2Bzkh0S1QuGr49qqlTgySii1xsijgefsnZirahVHS+Kc4162QGKQE+DaswNMhR
	5wT3hs/EvUQ==
X-Gm-Gg: AZFdTZfBknvZctAOkvzNMhDBSd70hxl9f+Tw+SWqeCp/5AI5C46NBWDO8OrU6zrIRV0
	VOyCKnJPITw68A1qnzsMCKTk8vZqSSZgk94ZSw5+S5lNF8So2Flx2e9DO451Q3EbV1c0YbAm1Wf
	RLzAIxVaJHEQYJFliIL/RNBohoIUmQiQSxuuqALXsYeP/2FgJbMT37MXRvX368I3FGfeYEsEB0W
	Jmovtbp2iA13C9azrCAClqWglPS98DlyPEutqeBop7jbZzv6wHng7N07dhSl0576WtKorEZ4DIa
	QLc1PT/u/JHGJuq5nvp2Tvvvw9KLMdB7F8A+XwIWsqwYFaB76U8OFPC7BgyNndJjoT4lahmDZQJ
	VG2GGqLFj4XhljoURJFym9ZWkJ8ciz+AzQ3rKkz68hp0IzptSvvmoUF5iNJF58sBmOENTrAc1uP
	F1sniCp6xZNMxIv9FSz/9izWsjZwl97WMrOA5ZLA5qINobCkdm1Ee2Q6zyL19a7hyrsSr1R1h6F
	VM1fQnY4enxKKgBeJvaUoHq63vXT9EJugbhfOmh8hBBXIevm0MuS+2wSDlkidU/BaIAYIJ3VXmw
	7gNnvigckuCmBBwCaR3dSZOwcLGyM05EtFc=
X-Received: by 2002:a17:906:3896:b0:c48:1977:e1bf with SMTP id a640c23a62f3a-c513aae225dmr1384824566b.24.1795786408121;
        Fri, 27 Nov 2026 05:33:28 -0800 (PST)
Received: from [192.168.100.86] ([84.15.37.222])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513b030ed9sm880006366b.86.2026.11.27.05.33.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 05:33:27 -0800 (PST)
Message-ID: <a7eeafad-5b49-4ff7-ac4e-38a7f67eb661@8devices.com>
Date: Fri, 27 Nov 2026 15:33:27 +0200
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
To: tomaspaukrt@email.cz
Cc: ath10k@lists.infradead.org, jjohnson@kernel.org,
 linux-wireless@vger.kernel.org
References: <20261114090737.64348-1-tomaspaukrt@email.cz>
Subject: Re: [PATCH ath-next 0/6] wifi: ath10k: make USB support work for
 QCA9377
Content-Language: en-US
From: Andrey Bondar <a.bondar@8devices.com>
In-Reply-To: <20261114090737.64348-1-tomaspaukrt@email.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Reviewed-by: Andrey Bondar <a.bondar at 8devices.com>

