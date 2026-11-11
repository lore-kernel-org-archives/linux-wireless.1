Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794390348;
	b=ncjo2UA9ZbEDoKQx67V2R4zL/3qTYDNIGpfn67gHfJxL7DLespRI3Zj3nMDd7KY/Nboz
	 vIYnVKGO6OOtFES/uzRvafIr9872uThLTqRNV2zRnY7m4elXJgLU+vV+JRWpr6vwGB5cB
	 SEmLsNkMA2lk78qItH7g5JV/k0Sbo0XfnPkwi0ur30hdQjPSOe6dzCHdUxjTFouGe4H+0
	 BBQ83A+ZHDsZh4Aig3nIpvtQNVWABNHmB9oUyv0cbEydxG5uC6dgKwuFn3BQlkmeHnJZQ
	 Nugbuq7GamxTvyQGOqz4UmNdBiSaOJeUP9p9I4+8+DbggCRvIVAgw13VrTvN6krQ5zQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794390348;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:MIME-Version:X-Received:Reply-To:Message-ID:Date:
	 Subject:From:To:Content-Type;
	bh=caICQAcU+PLKlOYRI3Xs1r/5EaUiACeAL+LxuX+u88g=;
	b=BweSNkN4+RROr3cQ/gCb3jhVfWujcliqIG/la5eMDXZNOeVvOp1oLpQoERF1bdmOnpDF
	 w6geIDkNTSF08NNymVqtuNyR8h0wR/YfObsxvWvF0I6wIpFfhIhPGjrPjGbl4JHT4jvtd
	 JEwSduwy0wEFMEzyQHmrWOFDKrBKvgetyfvgsxGOnzSGarTOLZGoTmiwFrEr/xTqR98n6
	 Xe3INTm2h3OAZJqopr8PiqwH5VMiWpFwXZNXPAFY1SATJ8GXN0XT2pfGaDlOdgSiDFVxQ
	 ysGwOw/OYmMYuOag+Q3eVBB5diZrSQvLSZ/YtvaEaHyCLNGkbg5LRJg2K6POBK3Vlpw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=T8XcAL7i;
	arc=none smtp.remote-ip=209.85.167.199
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F7AC606A332
	for <linux-wireless@vger.kernel.org>; Wed, 11 Nov 2026 09:45:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F7AC606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=T8XcAL7i
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4b26d8d2498so3404085b6e.2
        for <linux-wireless@vger.kernel.org>; Wed, 11 Nov 2026 01:45:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794390347; x=1794995147; darn=vger.kernel.org;
        h=content-type:to:from:subject:date:message-id:reply-to:mime-version
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=caICQAcU+PLKlOYRI3Xs1r/5EaUiACeAL+LxuX+u88g=;
        b=T8XcAL7iTn4HMDWR5oVijwdGVF68W3N/DraTi0aRdV2AJLAUf5tJP1cLe8pXf/ZiDc
         TgXG/u8YNfbdoEZ8uPJCShsR6/NGO190JKh4EcR3lji+D5+VCGj3KFcn9bnj97o5eV2Z
         u+ANWOk/MFpYQgr6WAluW5x9FmFVMNtrII04nRe49Xb0GFna2MBnYgascVKp9YpfyJxA
         kS/ASJoFqbLWhd31TYWso6q1stgYHZSfwhcj4qbIQGAz1XPb75dDD4whl/LvvoMjn74K
         EBBHC9yEDho6UWrdV67o/OTD7zR0Ku6BaiE5lX2Eyptyo7v3u4Q6pnsofYXVfyHZEDLL
         KOOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794390347; x=1794995147;
        h=content-type:to:from:subject:date:message-id:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=caICQAcU+PLKlOYRI3Xs1r/5EaUiACeAL+LxuX+u88g=;
        b=ioxSxohsAXDagVUssu/IPZ4p767YGx8+fcq8kIxXMGIwoOl10O9knWLzN8J6bq4jr8
         KXohS7RoSqw55nqvFoC6RdoCmTxHP8MyHBQgrfg1GU5krp+VOspzIDRRCcPV4VX7RKk1
         X1NANJLetzJ5IjdRodJ7CuNuGbOmaB/aC5ssZ1cxsoPXXbY+TADp2POx9AXkNYxz+hd6
         kq4xBZuJ8DrLtxWbbUsJi+pNRFyQXUoWETn1uwnshpNT+UZrxbWs5U7JtcHG7e8thFmY
         WuiZjBYqB4uL/kExiQzt8bxjIhqnXdf5ZngFWym5L5tq/N6kHQTVz0xoAlN9kOR3ceLs
         k6Xw==
X-Gm-Message-State: APuU4Z/iTSmjkCqUPSleiplbrnagTzFoZwjOYr/K5EsCcS8w5mh4qCCg
	lnnXw/H2ljCbdj9TOWjtpdZ0UotBm9QxLUmY9ogBCey3WZ8TkQjRY6mzJv3Cs+yQcKA6+4ciokY
	HQfk=
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:150b:b0:4f8:4ec9:b170 with SMTP id
 5614622812f47-56b92842df0mr1292080b6e.2.1794390347235; Wed, 11 Nov 2026
 01:45:47 -0800 (PST)
Reply-To: editorjbift@gmail.com
Message-ID: <autogen-java-47c2bb8a-6b0e-4035-983a-2a135108919b@google.com>
Date: Wed, 11 Nov 2026 09:45:47 +0000
Subject: Research publication and author details
From: grishb657@gmail.com
To: linux-wireless@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes

Dear Scholar,

We are sharing information about the Journal of Beijing Institute of  
Fashion Technology (ISSN: 1001-0564).

This multidisciplinary journal holds Scopus and UGC approval and welcomes  
submissions from researchers across a range of academic disciplines.

Journal website and author information:
https://bjfzxyxb.cn/

An APC concession is available for eligible authors, subject to the  
applicable terms.

APC Concession ID: GJ-21D20P11
Validity: 10 days

For further enquiries:
https://forms.gle/UqwvWoRvZxLoG4D6A

Please review the journal's scope and submission guidelines to assess its  
relevance to your work.

Best regards,
Journal Team
