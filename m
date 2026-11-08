Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794164398;
	b=JVnO9IoG+32v7TlCqsvEmyHm3Ji7volIOliD9xUmlQq2Hmi69oAGpbPbVaFHLPSIy/2c
	 dcM4AfjeqLO+DidOLWLQNTOGNRaJCw0KnSlbszW5jwoDW+o1pG+LMk1vufySBqPrYCkZ+
	 c3AmdnmnmKNF7NPJ98JlSV9iuXT6FRFI0x+8lV3Lt0zSKGzz+tIfr1m+39otct3c8SnyR
	 Se9PdFrrykzArO70IrUhf+1ymcpI6CzKQCW/3Kj37ORM8TCeBw1xz9jH0nVPLNlydHXB2
	 2sKGOMbu9lJH+ZiyChckqfSprvI3QOif9rjQvfLd9yD0eRbSgclPGmCFYeRHG1LksSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794164398;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=JLhUwzup1lwefYy8NOOFjthYnrByVfTsqIe79kkV+Lk=;
	b=DJTJNuDREYdbtisqjpFomKNdPsXkLAKEEX+UJdIM368Q6YgGE4DB4bCuyq5b/8RH/MSB
	 d4R5Y1D+pAd2Q3FW+qDfTvfkZ1CstbzYtSE6hYM3CBoEG/9f2BEF3eI2LhcNsK/VLyHfl
	 BjG8p6dc/WDB2nRIKNL+novPqUEitgQABpJG2B4agwlWu/nXgKijpuuaNBoLU4gfEAqbS
	 ZvDP091E2V13Qb6zmzgBLLx/XK8jOtfYsJf0WdY0448WcmGgsSo2JxSdKF7Izbi6S0Txm
	 RNEb0pXg9+BB5tAucXIiXxPW241rFkH0l06Wharoa2G6ZR7ergItIBQkLRsmb2OrvKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XrEUEgHU;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CBD9606A33B
	for <linux-wireless@vger.kernel.org>; Sun,  8 Nov 2026 18:59:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3CBD9606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XrEUEgHU
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4b79502c27aso1791425e9.1
        for <linux-wireless@vger.kernel.org>; Sun, 08 Nov 2026 10:59:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794164397; x=1794769197; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JLhUwzup1lwefYy8NOOFjthYnrByVfTsqIe79kkV+Lk=;
        b=XrEUEgHUwv+lt2Z0T4RzlOQuYT1yMbnY/MJrtF5HY2pc8m0ujKE+1IGJbqc3A1SsPJ
         Pz+po0Wh7ECcrOl1hyNdZBme+OsO/r11IeCA1lW9KMbstFhlOkC0Hm7Ef+TTavGsfrDk
         7T2AE8nlcorDhYFpLo0KTCt4xOv09AacMRilfH2h4PS2mZ0iBReAF8XAcgtI3iT+qlRY
         EJQPYUIUlDRCCjadf1+24R8V0flZyhCZpLCroCVsidoQ510350k4POOaAcSXgGRrBTWF
         rbpUnz5O6K0TOR8uz/zwLHiObwDAqnCJFWP0+ssCNYCBYnXJwQ2yMfUqdKkv6ro/lp/q
         XMaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794164397; x=1794769197;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JLhUwzup1lwefYy8NOOFjthYnrByVfTsqIe79kkV+Lk=;
        b=0wNl6ko8+aiLNwJTEkzxOyCeW2AgtxKEI6OA053KBe9XSTcBRc8B+HUfWOnGDP/W4R
         9aOEONtxHFxTZ2MvM0upt/aT+hmB9U/KxSXUd85iZeuBTQHwhnHRww1hIzBg/ked6oC+
         5/bPQiMTWqpJ2MknU4r1WMgb/Ozpi2nDinMIxB2etM1t2ZH1zAGeqrP7LtyQ5mQvG66U
         HRCona/5x95ssJUp9iPBK2EN00epNY+7LpPlKxlAkx67xGCcUYhirVg5qOqzS6IbQA7T
         8vkE6aqNhY/OPob3an9gQ1aNkGlFK+6kdIgBmPUvTWvXZZ0Zbl4a9MJ5YD5x8gE9C5Hq
         7jGg==
X-Forwarded-Encrypted: i=1; AL+hErFfHoD6nnIg/h05lyRPN55tOHK1qgp9D+lMAfDWqY+/sP7MpYFiB8DP7XD3d+rvZshP/o7TDT+trnk9mI2BQA==@vger.kernel.org
X-Gm-Message-State: APuU4Z8I4koObuY9mn4TmEdQ5wN+Wke+ihTR8ncIOORCw16RnbXDG3Fp
	QjxekaXWe2BNIFvlne+rolvxVWUMoxHwSYlgb026dAGmLYEH9KrnL2u1
X-Gm-Gg: AYBFou3OYOsyqpqvOr6FN3FTepfj0P7D0KHx8Akc6daLgMufwKn6HuY+LBWgoQwkrzI
	5AkPGLgb3q3WrY6QO3ycBj0Dg6uJ3jqJGXEDe9Kkfr0BUn7puIqcX8xI5L/qRbbRR7hQpG8G97i
	yFqHcP3M7vXcxNVrN/tcYBYAIv/HCVTlb3pZXcHknnww6858DyMLeaeHM696ab47ok1Zll6qaiK
	DS/IlHFf0diVl/TjcJbgIf7a/BU6fPwnzf1580IwB6OK5F4YYYQ0G4mLKuZIKTWss1qIlmcF/wK
	jLPvWefRcuwiQgQCTCXJUBjbmCnRpnoQi6M5Psu9f3Mx9j+8wWVEWHMmpvY2KIt7vVA0Odjyn0h
	Bl9aMPC0pjlg+Bs2+KpSUSJcdEGlap7fXWNqvalBizdGQkEI6OLQS88py3Sh3naoG6HCa5JoT8Y
	kEGMksbuzj+sZh49Q+BpMfcKFVCMGvxq2CDEKdpCSh+nfweUgZlciuwXT9lxGLZGNB82ri/WQbX
	cvIFz52COgevR7K0LXlcE+EnAMyCzuV7gH7nG56ehWSig22Ajmz4eu8hUvo56X0y4xhDY6P8/a6
	iiMWq4gnt45d/00difiID8/ylD4zvD6bLvZG+LMOub+uTDfJYuEZXc6WDFDLXHJc
X-Received: by 2002:a05:600c:468f:b0:4a1:7e77:c382 with SMTP id 5b1f17b1804b1-4b960d9b170mr35982125e9.5.1794164396406;
        Sun, 08 Nov 2026 10:59:56 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7efb1f3acsm185228445e9.14.2026.11.08.10.59.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 10:59:56 -0800 (PST)
Date: Sun, 8 Nov 2026 18:59:53 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Christian Brauner <brauner@kernel.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
 linux-fsdevel@vger.kernel.org, Linus Torvalds
 <torvalds@linux-foundation.org>, Jann Horn <jannh@google.com>, Josef Bacik
 <josef@toxicpanda.com>, Chris Mason <mason@kernel.org>, Jeff Layton
 <jlayton@kernel.org>, NeilBrown <neil@brown.name>, Eric Dumazet
 <edumazet@kernel.org>, Thomas Gleixner <tglx@kernel.org>, Al Viro
 <viro@zeniv.linux.org.uk>, Jonathan Corbet <corbet@lwn.net>, Christoph
 Hellwig <hch@lst.de>, Greg Kroah-Hartman <gregkh@suse.de>, Joel Granados
 <joel.granados@kernel.org>, Kees Cook <kees@kernel.org>, Jan Kara
 <jack@suse.cz>, Jan Kara <jack@suse.com>, linux-kernel@vger.kernel.org,
 linux-nfs@vger.kernel.org, linux-acpi@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-scsi@vger.kernel.org, linux-um@lists.infradead.org,
 linux-wireless@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 netdev@vger.kernel.org, ntfs3@lists.linux.dev,
 platform-driver-x86@vger.kernel.org, coreteam@netfilter.org,
 kexec@lists.infradead.org, linux-pci@vger.kernel.org,
 linux-sound@vger.kernel.org, netfilter-devel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, ibm-acpi-devel@lists.sourceforge.net,
 jfs-discussion@lists.sourceforge.net, linux-alpha@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-cifs@vger.kernel.org,
 linux-fbdev@vger.kernel.org, linux-hwmon@vger.kernel.org,
 linux-mm@kvack.org, linux-sh@vger.kernel.org, linux-usb@vger.kernel.org,
 samba-technical@lists.samba.org, sparclinux@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, linux-doc@vger.kernel.org,
 linux-serial@vger.kernel.org, linux-atm-general@lists.sourceforge.net,
 Takashi Iwai <tiwai@suse.de>, linux-input@vger.kernel.org,
 linux-raid@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-modules@vger.kernel.org, linux-debuggers@vger.kernel.org, Chuck Lever
 <cel@kernel.org>
Subject: Re: [PATCH RESEND v2 14/23] proc: let procfs copy in writes before
 pinning the entry
Message-ID: <20261108185953.28054fb3@pumpkin>
In-Reply-To: <20261107-akteur-gemieden-eckdaten-21304d085e35@brauner>
References: <20261104-work-procfs-core-v2-14-76ace653a773@kernel.org>
	<CAMuHMdVfakapgBK6TBhO1iWX8qzvLDk8jzRS=t2MVa5G=MCUeg@mail.gmail.com>
	<20261107-akteur-gemieden-eckdaten-21304d085e35@brauner>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 7 Nov 2026 10:48:35 +0100
Christian Brauner <brauner@kernel.org> wrote:

> > While at it, I think it would be good to use this conversion as an
> > opportunity to replace "char *" by "void *", which will probably let
> > you drop several casts from users.  
> 
> So I tried that too. The thing is it drops exactly one u8 * cast in
> ntfs3's label write. 

Since char is now unsigned that one isn't even needed...

David
