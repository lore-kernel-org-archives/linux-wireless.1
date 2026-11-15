Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794769130;
	b=d8U/rRsAPEsqmXS++bPdM2aw4zPainWDxd4cHbGSsFs2aXHoc3zeY1Lzcu6T5d1BSlCA
	 iUKTmLUWT1tx3P81Ow1UZ3aTaZLk85a7yMjgWeklTyeYbcZSq6FJLOfFxQWBncjlaCUS/
	 I8BOqf6WqOkFKufB3snFHp1c6lhs4FL6nghAszzmUKsTWVekpd+mI8JHdsv61K8CWoTIQ
	 YbofDaSwLaHQ2jlT4+GpmwDIdtbObIsgtk+fi+rEIbyjUu1ln8Xp8nq9GaNHU6B8pEVbG
	 vl5u9hnLfgLweOX5/+5A8xJ6e01HTbU5na3/D42kLrgikYVmKzPL9fqlcTmJcDfbFNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794769130;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=BvKuisBW9st6dv4iYQYmdk7UUIHA5W7Ob6TCeUj4NB4=;
	b=WHsOs5ppEgG2RXTwLpY0piRQF+woJuoCd4DYghA8qw46jtVxy/fIyOzcsaaORfFZMjTi
	 IDAn+EjgYCTOVJvhT19tQ3LVK8LDgHbwPp81EINOeGi4e2InjdivbY9y2Xo8rWV8sra7H
	 NjcRZX35Y8oRmbtVZ1ag4JUVUiECQcLsEnbOw2ep7XZ3BwzrcAvPFw4Rh0J3mbPldal90
	 QJb27HTzxDScREbyNlyWTZxmp24+BxYw1fghQSZMuD5nxTh03c6GnGbfuz8NAlYYNwnSJ
	 z+4wTay26lwWwvYly4WMqonJKACimwiybyzW+m29nTQsQuz7NMHxg4ysEFI+8yZ/gcQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aEoxaJhj;
	arc=none smtp.remote-ip=74.125.82.43
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27B3C606A883
	for <linux-wireless@vger.kernel.org>; Sun, 15 Nov 2026 18:58:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 27B3C606A883
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aEoxaJhj
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-1b3acec6677so3578822c88.1
        for <linux-wireless@vger.kernel.org>; Sun, 15 Nov 2026 10:58:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794769129; x=1795373929; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BvKuisBW9st6dv4iYQYmdk7UUIHA5W7Ob6TCeUj4NB4=;
        b=aEoxaJhjYDfx4ScZ7+L4NjQUNajI0PdG1J1JOxjZJT7LGTv4DBXLaKAi6WHOlabSKI
         I+khqWWi0Rgc+C9ZZrBNqqgshJBzZK0KAwQC5YVmVnh9u4Vlk2P20IQbVNRfaXi3M3nE
         hnCkU8zwdDKRtG5bNfEq7qFubwf2rlZusMF9UFsK3n/k6W3/ZvHzOuFKP/EmGzSA7I4a
         6D5ak1Ac8jPdEU9erARKpRgQrKjojKm2Q+A1V2KmquZZzHQWtuyITnPZGHWZUVU0XJtn
         fThLmy2Z7/wdFAhVI4fA9x/3y3xqobYCl7jfomPyUtkDLssdQa1vbYzHVpfnXCgcyNpo
         Brrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794769129; x=1795373929;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BvKuisBW9st6dv4iYQYmdk7UUIHA5W7Ob6TCeUj4NB4=;
        b=jhA9cBq00DjR7QX2vBbyckONOfi3zQOIQRtUXIZ2VmiOon3r8kmHmONCpt99UzULae
         A2lPVFV0tYx/Kd+Pbv3qbLDI/5UtzpNIvGac41bxsGtQVK8S2Dy7RI0RWgw35/pAK4kb
         KwsDrdNOEwaN/hySiymQpDwPYH8h/dacoUMhC8NNmt56A7jXhpyRZUbGF/UugVe5n4Jr
         5lAClzQ3ImsoAPrQsb6NSGopHKqiHXcleBED/jkQToPvvQjBhFLqR4t+VBkg2oFfyXDY
         FdUY4fhsZZRx2xGJDaIb76x96FuD9LuHnLfa32RsmoqBXUPFtgnw+DYKbeozNUXQJNBN
         1TwQ==
X-Gm-Message-State: APuU4Z9DNkLSzN063C7k+pMhzUtn2CNYw8iMiULllj1XMLpXKyOvlAon
	ufIUe+wHGYKVSWS8Z8fqXhYAJb5EF9ENh06bWEsSgKZg/+g9B5GHpstOaxe8peFB
X-Gm-Gg: AYBFou0clqvV5898CXl4N8Oc7DQaOZUeyuSrnFouIfBGi5MNqd8RoK8kG04rsn4TYfb
	n0Qx1MOgx3R30BpRbDg+j0XkxXqAKe/JY1cPW7lt15WzEfyn886bfSpKUPzBjBXAGgI+Jk9ir/w
	rjhNYw/sqCrs2rkYlIjKwlsyp4Qjozwdgy+qwohBw+s0edKopIIepG0gnQ/aSICh4O9Xwrgw6xp
	s9b/cVL1krYQG1KcXxDbNf0IG1IoPy8FkxSLD6vAlXgcp0vSYA6hb7tDyk7vGpCnuE5ubLDWG6t
	pz+45xIfWt173FyKu9M1GBOsLR2tUXsUt7fx4U7sPrBPcStfcVl/kmr8Nqh/tAV4YqImLVCgddY
	1Z5NpgxGZqooJqIWggR3GZMnY30TLOELrBwr5ZBu0dA7u5xyhIwjenISQaBX5kagV3H/sKNpSOP
	2qpTXt+JQBAqyyHNxyX7KP/r4G0MFnG3t6XSZcq+xobl/iNtQnqYQcerejQRbqNQPsPGuXKZI2u
	RNznOfd1FjjSIowzk8HealZQbcVehOvMsSkt4ZyL9FkU8IhZHc8vZufHYderJtlGytM8aExjjtP
	WovwYhT/900PkSO2CxQVjlLpRSZJuvcWuskK4evlfopY7zf8MdVdGw==
X-Received: by 2002:a05:701b:450f:10b0:1b2:41af:c21c with SMTP id a92af1059eb24-1b503157396mr7939805c88.39.1794769129109;
        Sun, 15 Nov 2026 10:58:49 -0800 (PST)
Received: from csl-conti-dell7858.ntu.edu.sg ([155.69.195.57])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5329ec87bsm82306c88.0.2026.11.15.10.58.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 10:58:48 -0800 (PST)
From: Maoyi Xie <maoyixie.tju@gmail.com>
To: Arend van Spriel <arend.vanspriel@broadcom.com>
Cc: linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH wireless 0/2] wifi: brcmfmac: fwsignal: bound indices from firmware signals
Date: Mon, 16 Nov 2026 02:58:41 +0800
Message-Id: <20261115185843.64633-1-maoyixie.tju@gmail.com>
X-Mailer: git-send-email 2.34.1
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These patches add bounds checks for indices that the device sends in the
BCDC firmware signals. Patch 1 covers the AMPDU reorder indices. Patch 2
covers the interface index of MACDESC_ADD. On USB, brcmfmac parses these
signals with the default module parameters.

Both bugs were found with a static analysis tool that we develop. A
userspace harness that compiles the fwsignal.c functions unchanged
reproduces them under sanitizers. No hardware was available for testing.

Maoyi Xie (2):
  wifi: brcmfmac: fwsignal: bound the AMPDU reorder indices
  wifi: brcmfmac: fwsignal: bound the MACDESC_ADD interface index

 .../broadcom/brcm80211/brcmfmac/core.h        |  2 ++
 .../broadcom/brcm80211/brcmfmac/fwsignal.c    | 26 ++++++++++++++++---
 2 files changed, 24 insertions(+), 4 deletions(-)

-- 
2.34.1

