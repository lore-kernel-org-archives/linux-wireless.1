Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794825056;
	b=uxetYtOwjH5n1g01ySg+9j+ry/RTNpuE4Eu+CrpX/je8EGl7o9zHknOYd9JbvZyMcwDD
	 bxt7fYnuRBcUoLJYRD2ZxIpI75DYazfU4/2rIt8/ROgSDeB6xbOdQRt3CW5L9O/FQwVd0
	 xzATk1vQYfUmp14LDgbH77kHuYFe/ZTdUWx1emLuKoy6wXfIJBA9O32jpT9ssZDTTwZ2P
	 7LjkVny3e1OWgGNtcTRbrlI46aq+8Am6UbzMnPbVvl1sjt4l6j65lvsp53KeMJZTRn2bY
	 l6XV4v0IaVI+6Hs9XhxijsScK55pVB/v0mPPSbm7FVHCQusejo8CpiwMeLQ7QY8dnOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794825056;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:MIME-Version:X-Received:Reply-To:Message-ID:Date:
	 Subject:From:To:Content-Type;
	bh=hXD/k1DOza/UxPFbePCZRuRmxhYFDU1Nip0rm6lc3ek=;
	b=MW3b5E1EdZ0SnO/miCeAgiu6ULKLPfWUk0qFO6Kw4RlpRPdcGRewKG5hnXp4xTrZCTH4
	 6qSawv7+qyzTabSF6HtVa8iOWHGTNTbB8aR9fR6Y9qwE7W/z6y09KRegi/w14EQ8d9Dbz
	 t77wzsvHIXDUgZxORTDIrMRq92JlIHMp1N6NaU1saTk4Efte/H7kO+jpHWUT/iwLtliBI
	 V43wpKNMqc8qkfySs8bjq66yU/4FkSbISxsvIzoASkhl8YYtpc0/26UY7UhR5VWs8UIC3
	 OZeomuye3ZSpybg8LuxDKpK1pW/8fqOYenYyUqy2SsfKnrgPEXIDaxfBv5+/rmgknYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eEqoSGhv;
	arc=none smtp.remote-ip=209.85.219.71
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9FA6606A31C
	for <linux-wireless@vger.kernel.org>; Mon, 16 Nov 2026 10:30:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A9FA6606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eEqoSGhv
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-91f184f3334so20994326d6.3
        for <linux-wireless@vger.kernel.org>; Mon, 16 Nov 2026 02:30:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794825054; x=1795429854; darn=vger.kernel.org;
        h=content-type:to:from:subject:date:message-id:reply-to:mime-version
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hXD/k1DOza/UxPFbePCZRuRmxhYFDU1Nip0rm6lc3ek=;
        b=eEqoSGhvZc8IYzN5HaNdQ5qlL5k291zPbh6RKYzWhI6dSE+L0v0fgkvkzAaE67wqNq
         bix3GUoEwFYlZV1HSV1UcIA/G57iNr3AlGBsKMC533W4MO+Ipl97xQRKDmk6ubR9zDFr
         6l3FETL3P6I5VLu8DNCaiKYBfA6yzcDTzcFf9N3n0ifKNYZCJyrEcrpoWMm8lX/BwSTS
         HncBPgRjf5ZnK+AYR0N1KcGTfju3jQAbljRcGp2ihQfyGNklgunZrEDnEkJPAsRuh4Fb
         qB1HRY3rSK7G6ZS+8rNTN681B3e7rscRz4ZA8FPDuNI8SZBAXyEFpPLsp6TzO+gMeuoQ
         f0YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794825054; x=1795429854;
        h=content-type:to:from:subject:date:message-id:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hXD/k1DOza/UxPFbePCZRuRmxhYFDU1Nip0rm6lc3ek=;
        b=GYymrR3KXbQLACD3QQ4kSlFnxSs+c8r3f/1WWE+Re7yzXoCSWhObKf6Ob5NT1VPFIF
         54hYzSmLbfG30o7Gzgl1biU5NF+1Iq1PgIn70/KEHq2ZswFAN7qda73KxFiAMKboE6Oj
         ljgUHq80AbHoH7v1RWoAiboRsGGhaQRlpFcCHgt5PWMDQfRWOirnFjpoAABLHP/lRxxi
         XinPu2ED1A1z98YusF6aNDy9xvvKsFQGP0ESmUNwoyA1d1dDyJG7FODBZBIiETUU5EgE
         6LxXE5gwdzfPXnob7kP7aSFBe6yckWKqpXyME0nL3LYmyfY0u1rE9fRk/n9Pk6yBxSO7
         7Pvw==
X-Gm-Message-State: APuU4Z8TYoNHlsvkbH5/BBJqNDYuiQiMKC5kJ/B8+az814JntFTJTcUH
	okPHlma1+x7Z3s1diD6oNzJulmUPgA+kUpHdJ0DAYEFOwSkxSxbOA5SRZamLBgfamVc1jtumQ3c
	EgBA=
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6214:518c:b0:91e:bae8:d245 with SMTP id
 6a1803df08f44-91f242477c5mr159978296d6.42.1794825054560; Mon, 16 Nov 2026
 02:30:54 -0800 (PST)
Reply-To: editor.adalyajournal@gmail.com
Message-ID: <autogen-java-e86de9f5-a98a-4bbc-a45c-417361687340@google.com>
Date: Mon, 16 Nov 2026 10:30:54 +0000
Subject: Scopus journal publication and funding for researchers
From: kushalemj124th225@gmail.com
To: linux-wireless@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes

Dear Researcher,

Adalya Journal welcomes original manuscripts across philosophical,  
interdisciplinary, and multidisciplinary research areas.

The journal is scopus indexed and accepts multidisciplinary scope in all  
subject areas. Research funding may be available for eligible authors.

Happy to share a short overview of the submission process if helpful.

https://adalyajournal.eu/

Best regards,
Editorial Board
