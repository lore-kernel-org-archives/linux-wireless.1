Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794566811;
	b=OLu4a40EFldbWoF8+Z9HY3GUgg9+Q2S0H4M2I6qvRoJw+odYcCAkjGbX0NRBayG5IMFT
	 bEg8Rjw92LcUPFJV6uVYMnGnRUQKSQFmgCY5SGtM58wZ76s5/cviwC0N45OfH00+cUZAp
	 ftQmjnwVjTQpUCWeaKRQpSJmoOxie6TDAXjkv+Ac1sIUFsNXaZ8WbRAutA6cClDuOM73P
	 CxidHpw0ph2drmwbOMCD0NHdwLD8KAnSruUANyaShfWg9GppVaTQ1kpHI2znbd5uXYn7D
	 izK/qRxslqQkQnUZebZPrOzcMrYWDFX1MxhLSef8tJhsFPDbtJ3BXuPTlWCvxoThSUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794566811;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:From:To:Cc:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=gtwKdoHv536tEFSAmnCbt23/60GZMyEFnWswGUf//oU=;
	b=TF9k6jKX190YuNJCWSjbYDNhg7MUU5R+iFIsA0YVjOtXoFB+iaLnujM15X3Z1lH2+1pd
	 8840udlAwlruMTt852aYr/yyWxggzgiIgFn4CAqlPWRsTBe5/Ur0jRWGSmVBp0GB53ndM
	 u3NbIIJ93DJxbP0iGF14owteByi+KS6LqGytBfeoHr14yWVY9ECvRylk5hlpv4E1dbhvc
	 2+a55vjTkDVm+csg0M0QHN30LaE9MLBatP1+DqPUgW+NaSlvugcnxqmADIwUb2QE9TfDP
	 EZCwMdXsIizGtRJdQfmYSnKvihuX4yYhOkPKl4nesk/u6v70Hlp7TKn03AIkwBVGLXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=s23ZDgGE;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A7ED606A31C
	for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 10:46:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5A7ED606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=s23ZDgGE
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a5720b0a57so10339975e9.0
        for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 02:46:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794566810; x=1795171610; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gtwKdoHv536tEFSAmnCbt23/60GZMyEFnWswGUf//oU=;
        b=s23ZDgGEa7ZvBbnXKxTwy7qFMsiZiKbn49CEPBI5CU1dHhxPWht/OvoIemCbgsMrqd
         obnqssw/C9B/NmcKZsGyKfq/w7rCh5OZlJPu8Ycvhy9oXdStknoesefEXpI/oBWz30AD
         6fQj8h6AgmW1zWGFdHjKq3m7AAG/oWFR0AW6on32cd3Ix55jvH/fMK2FYdyKTd2roRRA
         k/aK6PrzKyhleNEI8XeExqlutsfIx2Eae4D6KyYXACKAzj/v9HoVCAWW7n4XWvyoSmfz
         8pEs3ttFm4RBd/iuHQP1rJvukCGhYijkOIWnojOJbBpLUDR4caNHNnDWjOgEfFkPa9zB
         EIQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794566810; x=1795171610;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gtwKdoHv536tEFSAmnCbt23/60GZMyEFnWswGUf//oU=;
        b=aa2/ZHIcsi+C9Qzwi9nOjflJTOXO8PO/bEP8cYG2K9SN6t5iHLSkpy4ePltCOy6bmK
         hkxLO6GbWj9DJAOERO/+qDIEgFB1DEmE0gldGbHhP5W/TiCJE5OLhypPkzt6tR0/ugad
         rRQZeiTcW23jTa5Q5P6YeZ0IUWT70oWmtzhIcwt5e0VExXYVB3C3ciyhFnkWJYCZUvlw
         Umz0ECV/OWFw7yt2RV6Ag+w6Wksz5u9XMo4TLK6pw3atcbQ8HD1BMLy25sYfKwO148Kk
         8yfey9XNxM5qy1ul1fcGW4bg/1TSymYAbDFX+4xvM9rnhZr221CnHgBzs/3EkhmG1N5m
         Pw9w==
X-Gm-Message-State: APuU4Z9ZtDpTRWPt7WlAw4TeEbtCPiFAmK5pHpEk/CC+p5LRe5GmjDaJ
	Dmk4NLYsIFUMV4/AaACrRAe3E8wpM2OLKf2v2ONDRvgUI6s/qgPzIUWTT5PKXg==
X-Gm-Gg: AYBFou16ADwhnbtWZPpxYTSlPGxDDar8lOA16J3q2V/RmxyK16K6Vv4Ha3cOY61p4NM
	DMlp94U5VUuyXTo/zSi9mEPbpMsxnawvQOAmoh2sfA7icDc3y6SR+GUmJeMz4MjBY7PHuCpxqNZ
	yqER/jdwQ7imLomQqybcmTd9x+ZMLHaAy5CeAz+84aICgUh4vlNV3UEG8wD0IXir3qLCnD/VC0U
	v4HsAVrJ4OWzrDCuidWkghEdSIvruGmpSKkLMGVScQnnp5tAhCxlaBoDes15ig0FxGxF1C/Zwmf
	1egQhkwRMfd0bYHmKSQOlQf6YYKJOj3fHhs09yQSqLRZXELmfb3z7bzkt96Wgl+1cNijrwWZ2it
	BAb582LJ0x+bCLmRpisrFzibwkx41vi2m+IIvhh6eWFqnOUQ+eiFtZpWWrRi/LdZqVmWfL2WFjI
	zXdtqWAtGx3KlCee+vbo0NF+f3X/jz/HLSLrZiVcHG14OE14OKCgTGlxW/GWhRwoYICfjuNEA6g
	Ybe+G9DMxRMYkJ/v3GVT1YVad3DbRgiBO4y12ygY03oueODWfF8Jp2cnX1NhtEyl3oxbcJU/Wcw
	/kE3NbSB3FoN/5AuuVFz43AKn7RiNni/RzLHrNg=
X-Received: by 2002:a05:600c:3acf:b0:4ba:4395:560f with SMTP id 5b1f17b1804b1-4bb55a70e39mr46172575e9.8.1794566809438;
        Fri, 13 Nov 2026 02:46:49 -0800 (PST)
Received: from [192.168.1.50] ([188.27.124.137])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49d673ce75fsm329738f8f.55.2026.11.13.02.46.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 02:46:49 -0800 (PST)
Message-ID: <aaaeeef8-1d4b-4d31-9f70-fb7d781d7006@gmail.com>
Date: Fri, 13 Nov 2026 12:46:47 +0200
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
Subject: Re: [PATCH rtw-next 0/5] wifi: rtw88: pci: Support an older design,
 like RTL8821AE/RTL8812AE
From: Bitterblue Smith <rtl8821cerfe2@gmail.com>
To: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>
Cc: Ping-Ke Shih <pkshih@realtek.com>
References: <2033f1b1-fb12-4a04-aef4-923590e64463@gmail.com>
Content-Language: en-US
In-Reply-To: <2033f1b1-fb12-4a04-aef4-923590e64463@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24/10/2026 01:57, Bitterblue Smith wrote:
> 
> Theoretically rtlwifi supports WOWLAN, but it doesn't work for me with
> RTL8821AE or RTL8812AE. rtw88 doesn't support WOWLAN with these chips.
> 

Actually, this looks like my laptop's fault. I tried with RTL8822CE
and RTL8852BE, and they don't work either. The wifi card doesn't have
power while the laptop is suspended to RAM. There is no option for it in
the BIOS, either.
