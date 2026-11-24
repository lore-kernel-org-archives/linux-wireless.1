Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795482660;
	b=Ld2Y27sAojxZrCbfKbHX9KOqTT46itpz8L3/6r4RWnqDBp1conJV8gJvovKMJe0Nf+fv
	 r7jfAVSOI1XgdK/SMUyvrbSEBUSCS1dyYTPn6+pxoz3jOcXi9ujbQb/E+nATozUzVdQlN
	 72qf03zGNLj5LPs7dhZtqpPLviPNirLye8SArm9R8aKoDad0Y95pSdbCYynLG/0vgBKZI
	 F9VyxBhe9BEJ+NuMj2vhH/iJH+ZeWwv3POxrUg/ebuaYB8uevy+ib8zYZzoKIX26BHLxI
	 Ldoxd7l7hgnMtShim7AVu0RGP01iFyLwq6OhcyOtFRAmdbzKFrQN1mZjOuHcAvryoiw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795482660;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Content-Disposition;
	bh=CwEMPI7Nv8Y4G/uSjVrKaLXUsD6jBVuvooxioPWLmTc=;
	b=jbU54C+YOLNT7hMiKNkRtY7B8EUzqCJ9BmrHbSH1uOZCBuybGOnszLPAbFq09JzYujmY
	 CD9L+KFXgIr2WMX2DykCSUel5mmBW9TnAXZ/m15w62e6D3XDVYKkD5iERknSgQ7zUpjU8
	 iVpgMKdGt2icACnfspTo1KZwaIw+KnrO/xIM0WpVRwcgS35O/i1U+DSZgAbqxNImDNjfZ
	 YRQG78LzVfLLW9eugiJgU0yFwwjbDj/dnYlnchujbEh8kXoteXUt4QAgbZrGvXhFj21g6
	 S9azURbrrhEJzPGqV0GLzucGhYhUz0t1nC8FEaZbxW2cUpDfiyF3NO60BgKbJRA2BEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kKG19Co9;
	arc=none smtp.remote-ip=74.125.82.49
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE3C9606A32A
	for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 01:10:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE3C9606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kKG19Co9
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-170135e43c7so5626873c88.0
        for <linux-wireless@vger.kernel.org>; Mon, 23 Nov 2026 17:10:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795482659; x=1796087459; darn=vger.kernel.org;
        h=content-disposition:content-transfer-encoding:content-type
         :mime-version:references:in-reply-to:subject:cc:to:from:message-id
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CwEMPI7Nv8Y4G/uSjVrKaLXUsD6jBVuvooxioPWLmTc=;
        b=kKG19Co9tDWF2kSXK9dKvmLlvSosMXN5A+fjtmNUuhQN82VGIHKHSt7hl60KkIuTqu
         OTELZTKud2yzTtGpJ7YssH7XaqMzCZGWMYDkBuT+NcCO6f/J1jqPT0iyZQqXfdWQVo+7
         NpL+BVzS/nn6KT8iZArKwzuxRvPxz7vHEFH6/T2KHs/4S02PCeK1dyecPiT3ra5J0+fQ
         /fgxtsqz+bypFUe4822LHXZAKII+1BrHRYFU9BpYbk+8Uqr0d9LvdyqMqVFfzPKr5ne0
         gjqbIHRdr1UAU+rh9u1Qy9nf2cgwwJCw8nbQvW/s9TlQ/Z33NtjHLWdZggyn3wfRzLHS
         ZRZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795482659; x=1796087459;
        h=content-disposition:content-transfer-encoding:content-type
         :mime-version:references:in-reply-to:subject:cc:to:from:message-id
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=CwEMPI7Nv8Y4G/uSjVrKaLXUsD6jBVuvooxioPWLmTc=;
        b=MRFxNEoJgXHBXR40QIHKaLGpu/9TojV1iFXmHUDNsWC0sHvVkUl2HNxkRE2REpJF59
         sTunGPMhLQlPT5nstLT0vkm5NWySZ2Ia2GkO/fCOR7zEh/qg5Hg5dAFnX6AvJ78/52uV
         D42w9Uf0JGNBaRG0BlUACXibcFXFfFvmUspryYOGlkNjmKcsE0v/SkNLm/6NlGqY7Rbm
         hYnQIYgwhdgYxJQ/RHkpc62M9rssekZ8YLyrwLjXYKqKf+Hv7pZ8UmV533gUXchDIz0F
         ymD2Uc7b17kHqVz9lmjcA3YwksL0wqGdtCt/zk7W3QxR7VMKYK4hSW/nXAYUdSt5udxk
         uLUw==
X-Forwarded-Encrypted: i=1; AL+hErGKxWUnOr1LsovH9xokW6ahhasX8hYuYDnsy/8axSolzXUC99wy+ggfZ1K8KFDpkq2qQgiZbbOPOKIDjy0RRw==@vger.kernel.org
X-Gm-Message-State: APuU4Z8wC5a/Kga7DD/w82lEPBLVtFDUCfkxxkDIswcbgGXBVdC8swu6
	sIhbYxQHvrzWU45RDHQOqF3alH+30yHcbHPiiuCbPZW5HvMXdB2NBqXN
X-Gm-Gg: AZFdTZfiUNgtfoV2dtccUr2kcU9g56GibGg39mHL8OtzAH87BuC+Kik2Q0faETVqaqw
	+CK2N6aZl+cAKLKmoIloHkTVIxZN4BasNb57ISJiuPMIj4IjKGtJy2iMYaAojiv8FaLyTZ/T/BO
	LFXNNf6Gjqzwvz4VEKDDPM4DEKxcor0bycyk/F44pb489gGLjFS/Sk5Pvp7BUBxivGznrvF8BjM
	I4muPI3IKhNmEU9kvcByXm2hDaUqHOCYs5dEQ2QgUUv0UKVolPHU0IpyTas0B+zm0YeC+Ihih5E
	Yvy86e24unusfVz9Yp9TRv21BbrCmBGM99uRVuYYB/r3ulDj0HtP3A9b6P+IEiEunP8rRABnfxb
	3xBXkATsqPe28CamXrZwY6EvyoMWXtLB1o7p11fuziNll3QO7QMBq/t6xwWH1EOnJ2Rjewqi09M
	7dDucc60WwgJpqNNWbElh9c7TZuslC4ncUemNwLgmbRG2IR2TMTTGcQm3Mgf3JbEJpccOqByA53
	ccYb5vkfr6q5gAJAQueSOBDx2NAIUPm753QkYm19hnl903yef+41OKvsuOW0aAlxtq8dYadIW/O
	qJfUEiG2EVWOdmEBY9HH2ld/j45RV3FadlQYtVxt1HV1RMNOYX43d/Dfl5DzTukmp63y3g==
X-Received: by 2002:a05:7300:c695:b0:37f:73f9:aee7 with SMTP id 5a478bee46e88-3856c9a6408mr15050898eec.5.1795482658749;
        Mon, 23 Nov 2026 17:10:58 -0800 (PST)
Received: from localhost ([2a00:79e0:2ebe:8:4121:d698:201c:9274])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386aaae4960sm15816977eec.18.2026.11.23.17.10.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 17:10:57 -0800 (PST)
Date: Mon, 23 Nov 2026 17:10:56 -0800
Message-ID: <2f25009cbd67a8ee7b417f12b35374b1@gmail.com>
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Arnd Bergmann <arnd@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Johannes Berg <johannes@sipsolutions.net>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Kent Gibson <warthog618@gmail.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-sh@vger.kernel.org,
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
	linux-wireless@vger.kernel.org
Subject: Re: [PATCH 0/2 v8] gpiolib: finish the legacy cleanup
In-Reply-To: <7dpg3x3gkypkznzhuetjsqmk5fhqwuwkc6kupbs52zqh5mibgx@fjow6eodw4pf>
References: <20261123085723.156933-1-arnd@kernel.org> <tdc6h325jthjgyik2ne4oistkm563maoc2cpnffqu7hh34tpl7@oscripzv4dwq> <qvmy7iaxc7cjy2gkajqkr5ma6b4lwxz5ff64a5zsqrgewkxodr@odbjlv5x3hix> <8296a5c2-0aa2-4fc7-b65b-9d336bc4dff6@app.fastmail.com> <7dpg3x3gkypkznzhuetjsqmk5fhqwuwkc6kupbs52zqh5mibgx@fjow6eodw4pf>
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi Bartosz,

On Mon, Nov 23, 2026 at 04:41:32PM +0100, Bartosz Golaszewski wrote:
> Can I apply v7 and provide it to the SH maintainers on an immutable
> branch?

BTW, I have the soc_button_array rework (converting it to software nodes
and dropping "select GPIOLIB_LEGACY") on an immutable branch based on
v7.4-rc2:

	git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git ib/7.4-rc2-soc-button-array

I recommend pulling it into the gpio tree before applying Arnd's work so
that x86 builds with INPUT_SOC_BUTTON_ARRAY enabled no longer pull in
CONFIG_GPIOLIB_LEGACY either.

Thanks.

-- 
Dmitry
