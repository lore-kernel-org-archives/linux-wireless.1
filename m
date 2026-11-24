Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795551959;
	b=sVk4QG7cfikKQLpWk11U+AvX+H9hpZiZaudEmMCO++mFyyNWYQmPc1HMAz0bC9n/WBk2
	 KNRMh6JghWrfHwWvSwEhBuL2595tgJUFUSyjYKRvXenuVs+g7p5/+i5/rmyYQR7xi/e11
	 OOPDYhMNuqM+Lm0H42h+21MHO14Jyhe3L6csXdAF/7gJ7sxOCEK5HHBbOmrl6817m/ZyE
	 Nxgk0S+TizYZDqhrMF+uJ3SUTddON1wmDy5KvhUN1sytXUy+FsGomF92joDkG9jJoYyuq
	 SDkqk8kmP+cpUlDrNA/M4jxws73xn6r37Fzmm5Eu05clSSOzbZjSBGmYG0Zyf6lX+3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795551959;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=0vmGYU81o8BUW+PFvlj0Jh8YYINSsIZoDFwQ+4K/uBY=;
	b=jebsMyg7mnwP6rCzOjiZKXoSqK0Cy60vU0mnWfUT77KyiDg9Ui6uX7nGLxCGHHrk47Hz
	 w+WuHbUvMZ6pjGBqSNcD2EUI9E4OFHuJH+1Su5lCw3lNdDKQFiLeMJ56fLBx6jt+oCTV8
	 I50fxYHntNpii7YHm9bIA3na4DyP5G6tcRqA7tAz4RbzADgIDWPmnHSx9PdMrMOddu1/7
	 DdvWYMKmTgVIo9I0SwtOjE/lpU4w4aZTw2VWYCmRhiEfmHK/q/ZoRtpgcNPzthmktKCWO
	 1TUL/kGdxzmaGA8wRcKyfW7NEfSpJ6O6jD7jxBZryXVGVntC7jEESUjxxRmuBSXFkOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CTpyTfXP;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C676606A32E
	for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 20:25:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C676606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CTpyTfXP
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4bb68c197c7so63728775e9.1
        for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 12:25:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795551958; x=1796156758; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0vmGYU81o8BUW+PFvlj0Jh8YYINSsIZoDFwQ+4K/uBY=;
        b=CTpyTfXPdC7C9HnwuyN6Ne+WgvDbpIoFikodQvfucLMnITY52nrw2XpqOvsAyXRq2Y
         QXPaOjDEkx1bTlM727iumbjEeuX84l9z8JmHadfk7K6XFLWQystooPtj3h9hZLBlKM6v
         ukToTBVTwY+2OCHMcdBcMuyW/TlsL+MRpr+AJ+EAR2q4EZvFY+pTD4/NEBqs61/USSda
         SXfpfK7xNxLg0dy3KSd6ZTGqwlFoj3vznqDfvmM7seh94yuYAkY3lCYd/Lc6r2B1bzNB
         PeAmWw+/T1xJNVBubvUujCYgtJS9SNdaPuGxJh/ne7vaV2g8gT2pTojeNcojgdLwnpfa
         u0ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795551958; x=1796156758;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0vmGYU81o8BUW+PFvlj0Jh8YYINSsIZoDFwQ+4K/uBY=;
        b=2MiZgqL4qobG/K2jdpVjuKW8br7ii7L2N5cR4QJYQGkGUrUR4heqDeWbhjNaGMfKvv
         9s95eFSpKG3WC0fXG8V6X4i561wxMxy+iYaSJLshkf1Tjqzx9Pbyn6IqlLBoS01EmI9w
         UHMIQE7p7b465QpxdGlZFwTWgCvR4VRYkok47pmoNgJLvUoGWiU4edltO+UT6bR7Qgk4
         0l84UACTUK8nFZGdvIEW+ke+nj/sEURa/oMvh37b5u1E7JWPnZQdMQIXUviVIvdXPYqg
         m9FQNWETqQ+5i7uDuqjm59sWTunJ0htS7VvVN0cSw6AzDR+A8UCeCYEwiJi8TgUrpJxW
         Ap6Q==
X-Forwarded-Encrypted: i=1; AL+hErGDfl5SN5Dq/hXGuEPCIFwdPQPkKpr2qINHDxjEvP31TLvdRxIuFLrAYIHlcH3jiWvyQ/s3t0UVOq3S2UFkjw==@vger.kernel.org
X-Gm-Message-State: APuU4Z8zvXaVcqPqUa1kHFei8eAnQIRALCqP/L94BboPQTlxRSvh81ko
	7l4jHVOCGL55oKNbmGTq+aiowYwpNrj2ZUhB/8BQYGShotvYWyvvB1E=
X-Gm-Gg: AZFdTZfnnO+QASaFmWt0McWunR+TRxLJD6to32kmzw4uTjf4G8o2KzveMKt3gierOHG
	BBNgbNlUqUjO8zIyBadMaSSCZhsVElZWpXZjh5yUjiVB1GZR2v4edHJK+pOw1m7p1OeV3t5YGsr
	Qk8rNrRLIBAbuGPRhpNa2QIlAxex05acXoUBtbnQ8vmuxpLXt/AzJZH3Sry0B2M4XxTDAKisTcE
	hZ+o6NJPXkq720PgQLOxZIsKUCVGsYbwlIiaexBk83agr/sv6YAfjZB8aFIOrp+cyLBx5cCvhT6
	Dy9a4oGIoeSVGmEBkFfqG49vfXWtkSN6Vqlw3ZWb9nRJbziItajKNc+0qgBS3G+XnyJgz5hUAme
	SYV8YYq4BRrPnq0+hoUPeKYY91BjiN1IiMdz25k47HTGkDZaqkxH4/5KeSD7Z9tTHGgYdqQXWv+
	EHP7Jaks6HsZPJSxizap4GwkI4MSybTqhb0AfHTftmlmvBZULY0ihc5+WpOY2nvru2YSmK531Bt
	XRD214gjetx2IVEFSUK2c+55r60gpaxWwv4lBZdvSKaCVByAmO7hb4rWQjy7NtL0JwN+he6a72D
	nsI/vDL6v7dMyCuzYFBsIeqSLSuYc58yukHn
X-Received: by 2002:a05:600c:848d:b0:4bb:694e:496c with SMTP id 5b1f17b1804b1-4bb88810b39mr337481915e9.22.1795551957657;
        Tue, 24 Nov 2026 12:25:57 -0800 (PST)
Received: from localhost.localdomain ([2001:41d0:303:db6b::])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8849e598sm422589015e9.8.2026.11.24.12.25.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 12:25:57 -0800 (PST)
From: Tristan Madani <tristmd@gmail.com>
To: Brian Norris <briannorris@chromium.org>
Cc: Tristan Madani <tristmd@gmail.com>,
	Francesco Dolcini <francesco@dolcini.it>,
	Jeff Chen <jeff.chen_1@nxp.com>,
	linux-wireless@vger.kernel.org,
	stable@vger.kernel.org,
	Tristan Madani <tristan@talencesecurity.com>
Subject: Re: [PATCH v2 wireless 0/3] wifi: mwifiex: fix three firmware-triggered validation issues
Date: Tue, 24 Nov 2026 20:25:48 +0000
Message-ID: <20261124202548.1421427-1-tristmd@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <awXQpeeRwME1kVFs@google.com>
References: <20261124174620.1572200-1-tristmd@gmail.com> <awXQpeeRwME1kVFs@google.com>
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Sorry for the broken Cc, and thanks for fixing the threading.

Build tested with the series applied on wireless/main (v7.4-rc4),
x86_64 defconfig, gcc 14.2, W=1:

  make W=1 drivers/net/wireless/marvell/mwifiex/
  all four modules (mwifiex, mwifiex_sdio, mwifiex_pcie, mwifiex_usb)
  build clean, 0 errors, 0 warnings.

I do not have mwifiex hardware for runtime testing.

Tristan
