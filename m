Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795353813;
	b=s7lYYCak0oU4ZlJlISzy4HoMTBqj9UhNLf5ORVRA6tzaQTMFhYdccBRy8ae8F5O4g1uz
	 7SIIielURBA0/mOlLzFAJXNAf56F77CgBiCfRW3fv54tja6bSCVLXK7xProT22w1fAFh0
	 KGO0kY4z/XD6V55PtYLbXCNBqTk6zfssykgMpPfgDFbSwTmERUvF5ZKzCmhyhSxezAqK5
	 oUibfKCcySXsuMcNexcSL6ajiAdv9yVgKOS1RboqkDEhMItt6etyADlu4DFnXe5AaTW1X
	 Rn3x3MLxmLUJF/eNXS5hI/cJNFJK3VPRigqleNRTXy0n+kCy6LbekBIoggElfrJyqAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795353813;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=tw3cb2+kYjvBEJxGE8m+S5W8haGQ3n6c+8DpmSA4lig=;
	b=X3jYI0Uax9JaXok8efE3LCODl1ql/93JkZ1Gw4LQpoKicTCH6F5bwxUy1YQOvFVKDoJw
	 QA488XItFpoaYRg+NxBAmTMAvZlh2fAoeFLY988oHpApuqr5Bf+XvLOWgFZ2dNkaVQC0M
	 +g1Avir43PXjBjF1ix/Il527nSV0HFFL+pe3s7gnY0BYna5rw/uK0DaRIxKf1kAA/yfwi
	 7muD+gwzpUH6RXcQiyJDqV8sQNW1PAUKCReERNDMcP8dvk7oBnPew/yFyHhF1zP0uOR5Z
	 FN5eSKxLxyJKblYW3YxCOggx4LVEXuqchmCJE1zqMrkFcVe4iYCUPUjF3p9GhoTg7dQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="dVueh2F/";
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CE90606A320
	for <linux-wireless@vger.kernel.org>; Sun, 22 Nov 2026 13:23:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9CE90606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dVueh2F/
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-490d59c3f0aso1071538f8f.1
        for <linux-wireless@vger.kernel.org>; Sun, 22 Nov 2026 05:23:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795353811; x=1795958611; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tw3cb2+kYjvBEJxGE8m+S5W8haGQ3n6c+8DpmSA4lig=;
        b=dVueh2F/N+Getk0I+AECAKNKoV/oXd77I1gtZ+8fnw6dtU5L1J948svQ/PTK6+LJSN
         iTea3DEaBRhR5onNQ1VQnRYIR7Lyo3PSaED4iq9WVH48kAJpQpNUG5xxep2Jw9lsZG/E
         0TmPUGcAabpEArLGCIah71z3OEhwJKJw6nngwWqpsQe7zugDSUguvLvHuAzx5b+i1GhB
         V0t9aQdwu7UxNL6h3bAYQLAs7aqgSRbqbJK1l/o5idArCDNY7Lr40NHiBl7+Cvaom/6N
         EdJyIbBZdb9x40Q/PscdynUih0CC75f2Axa4rp72wcylieEwXou5eys3ITk9K/okp92F
         0DOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795353811; x=1795958611;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tw3cb2+kYjvBEJxGE8m+S5W8haGQ3n6c+8DpmSA4lig=;
        b=KS0weILTIRwa3lnhiH89IV7FrwH/oN85JNnd9AMCUidC+tKY3geOzA9wwOQKFH/vCb
         xNSA1UL+12kqIi1GVw55Ed1+2XPIZGSBabyCHcItDsgT7bP8cAZ+3CLsnRlg1+osBW2g
         WwQf0gVFDSDnvXDak0TeYmnip9lH4yqcWs5py2wO9GuMDjIaFycuC4lqH/5zGANYY3HS
         OixApOcss/G/TpLHw2oyVikMArW5U3yFG4V/7n1WTixw4aLqD1vDhCPUoeqw4xa7XG2I
         r7A1Mgeb6YYImdmXIzGf6n4AKIPDQ1fqnwjPLP3ft6C5TRBLR/YcfHPi8sTbOMn5/Ych
         eLiw==
X-Forwarded-Encrypted: i=1; AL+hErHmq0A1sRErvOhqY/uNMUdKI8Hp3iDQMty0cNYtxn6yRb7pk5lMcw8qVFsb9786Czso1QpPa5kt/bABO2r9SQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z/mcMCG5WX66ati2J/CPJHf6vgG2ydawA0/HtDd9fQ9rqWOFT1U
	tJ7uiLCNu5VCufB3Ly0ncIerYP8EMbl+oR8usWFyjxgqbj4G5hpMoHU+z6sJftvK
X-Gm-Gg: AZFdTZdKgRyTZdtjvYhXaq2SivrvsXOJNhdYDpQRyNUN1MeWhfRe1SI8gmErnSOzu6d
	EDMdk/TwhyJeCPMnH8gfOe7J2U5mYJKYhqpJyvUqDWugrX5lXMjQqIC4OXTqbxL35OUaQajUlfI
	0fSJ59JYQ5elRiqJbxynVXoyYME8MYtHAxU++RC7frlE0sPPM74BHMzaDKCs/qwwcBSA6pBgdXd
	gTyipIeL0ulZ+IVxbu1MtCWs7Q1rmYIsZPogPyPMMxv8oUA3JxxEnurTyLac7U6Cb9q3mdvXGMa
	Ba+NNi5+f1js4o6E8rWdKRbdw1p492flopiTYqDN1ueTomSMvL2G1qMstQOjw11Nm5NPKkoNNHU
	V/rEQMCeLPImVvCxt6VgaanR3vmbh089MeX/UBvkjIvfarK+T9ZXAzPnrebcudZeoOf1Q50USJv
	KtOLKikH72sq7Yg9z/fRewMXyRIpginLHCEe+uuCrsJcLkcdJLnXnZyHWPOh5TpO1bAJlx4gNRK
	OiMWDeK/FIqqk46AxKtGWjbNd92bhnB0jJNkHive+M2hjSFi8KJXNy9EwnuvDpL26Y8LcSMIOZY
	Rlx3/XcOZw20DkB90yEO1+lIKDQj224sHYUrgv/IjFoK4pkDoPFNFSloPg8tTWCwhb666cwzV24
	tC8XLyg/FbAxd+2KF6FGAobIOHY9UpC0pmdcG/vXNbj18xyT7OcEdBtCqkFawbBt8BlHyM0vpJ5
	XknyfiRKH4ZNcv73ChRywzOrm3+8sUY57hvtKHiLgUWRpzrpNzp88L+w==
X-Received: by 2002:a05:6000:2997:10b0:4a8:12d3:c0b2 with SMTP id ffacd0b85a97d-4abb47b2244mr12544395f8f.23.1795353810746;
        Sun, 22 Nov 2026 05:23:30 -0800 (PST)
Received: from localhost.localdomain (dynamic-2a00-1028-8388-a84e-20fd-ec9f-e3f8-60d4.ipv6.o2.cz. [2a00:1028:8388:a84e:20fd:ec9f:e3f8:60d4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a68048esm17106499f8f.29.2026.11.22.05.23.29
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 22 Nov 2026 05:23:30 -0800 (PST)
From: Josef Schlehofer <pepe.schlehofer@gmail.com>
To: stable@vger.kernel.org
Cc: Ping-Ke Shih <pkshih@realtek.com>,
	Bitterblue Smith <rtl8821cerfe2@gmail.com>,
	Nick Venenga <nick@venenga.com>,
	linux-wireless@vger.kernel.org
Subject: rtw89 USB: crash fix and RTL8922AU IDs for 7.3.y
Date: Sun, 22 Nov 2026 14:23:29 +0100
Message-ID: <20261122132329.52933-1-pepe.schlehofer@gmail.com>
X-Mailer: git-send-email 2.54.0
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

Hi,

please consider these upstream commits for 7.3.y:

b1827227176821af9bba0cb643728d23328f3660 wifi: rtw89: usb: Avoid crash with dynamically added device ID
de2cb461456143a69845c24ce38ac14a61d6e166 wifi: rtw89: 8922au: Add support for TP-Link TBE400U
475539db19530b7e134f58555e1afcae21d419f3 wifi: rtw89: 8922au: add ASUS BE93

The first one fixes a NULL pointer dereference when a device ID is added
through new_id, the other two only add device IDs. They apply cleanly to
7.3.5 and build without warnings. I did not reproduce the crash myself.

I will send a backport of the first one for 6.18.y, where the RTL8922AU
driver does not exist.

Thanks,
Josef
