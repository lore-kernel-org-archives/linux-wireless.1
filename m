Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795480537;
	b=MSdhs2o1YA7hPEANVU4aT8cPF2U8fud0AwmpOXktIh0VLzSMAm8gcXIqKyJQyuW15zzG
	 1isFJHsJHXZEcd2AA74zHgtVm+YsxlFs3bhwnhRmqsalSCQKOltyhp/1b3+ex4UsFAoBU
	 C1cCKhmnC08gGaLdxpCxF8dl7n4gjeZjJ2J7MdWqthnm+fdCyV+vc6o1MHCN2dYfW3PGr
	 YNS5jLRCXwNvhcKuBPrt5O1Bg2ROqf1NsgXh7MQ8GK1dzi463EvslqK5YvFMjsXblLEMp
	 HzfN5XYKVEJLLp8De7E4oKUSsM4meRlJIn5eoWZkBh4c2QE0C0wzGIX6lqdUtPKa1jw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795480537;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=54AZ6SKS/WGadGSayVpKrc9b+qBd+x9Tajkrt4xNULY=;
	b=JnupOpnsmiIruM65v3olqzJA0wcSjU37vPzkS4TwO76reF79FbXcv2Sxfgf456eILGRO
	 oa/NPHrKNIofdFkFyKFwjIegX7n/cjdJ0y5pSfWGQfOqJDWKhUetL7FOqrGzXPoBAZVYW
	 Dcc1Sk9esuOxkfEexkwUfW5u/m6ARmApe8p2Rx9BGHErOMTMGGrjjCyaxMlx7PCJ6526V
	 2aNY2hJzjYhSqsF6DcISYz35wIct9ZeythA5q11MKy6MOPGjZ38Qn3Lnhf0ZyWf9p1CXw
	 3XNtggeC4dsSjOjxYP2NpCayM2A5P1/AWhDonIOMmvy43z3b/uJ9fMspJk22RzNVRHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=iiitd.ac.in;
	spf=pass smtp.mailfrom=iiitd.ac.in;
	dkim=pass header.d=iiitd.ac.in header.i=@iiitd.ac.in header.a=rsa-sha256 header.s=google header.b="UGko/FDR";
	arc=none smtp.remote-ip=209.85.210.176
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA9BC606A321
	for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 00:35:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CA9BC606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iiitd.ac.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iiitd.ac.in
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iiitd.ac.in header.i=@iiitd.ac.in header.a=rsa-sha256 header.s=google header.b=UGko/FDR
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-8c4cc85a315so2839589b3a.0
        for <linux-wireless@vger.kernel.org>; Mon, 23 Nov 2026 16:35:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=iiitd.ac.in; s=google; t=1795480534; x=1796085334; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=54AZ6SKS/WGadGSayVpKrc9b+qBd+x9Tajkrt4xNULY=;
        b=UGko/FDR5eWbbxq49NN6iIodshLicoRmWofIzKSkGsqd4SC8p5OBvI5rCFYcCHPy5x
         oD0EbNVJX5V6UZL4JO4uzefVG3aIg8cx60MU8f90uINstbdfaQ5UVb4duw1CUtrP5EE0
         hd7FuIhiJuVxeB/vg5kf2jHER29IIaVYcppuc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795480534; x=1796085334;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=54AZ6SKS/WGadGSayVpKrc9b+qBd+x9Tajkrt4xNULY=;
        b=ToFi+Py3wyNX56gdISnlM7TC4GLfoqmPMj+UOQjD+qD6rqKo+iEsUF3CrFbvBDTh+f
         XrRBYLSBC0ID0qYIQdQjqqkTzIJSJdXhbjsqx9K3aFtdW1brH67vb8+jLFxE+bn3t7Yy
         WRvKPWeHlYbIEANjjkQIK8MNeSqBlG9/MqsCeGbFaRl7247mkLdzr0XLveiFW4xzcb0V
         fS+w+C85XzQD67KSV2C2rt6dRfVR0HNt8hBbbQWsv4yD+7+EhA8DJV5VbTlFIC5vcQjV
         Sk0oZO5v/ImM3X7wRk8XbXCFkxoDQd3a3BBzNS6tcLcB+LzxV15lQtQKZKOG7yEhI7oq
         4bIQ==
X-Forwarded-Encrypted: i=1; AL+hErEac7dd6JO7eYbbEliAWmcai3oDdG8VB6L3FeHuv+LYV2Xk8IK0IZd4adH5ZatKBD/6GQkRfMAMg3oQiwUBfA==@vger.kernel.org
X-Gm-Message-State: APuU4Z/kiS+J/ixGsm7sbiiDzcDntus3NMRBS964umuwBaUQSMqgqMyc
	+lf2jKFlxB4TXdkcfsKJOUwTK5ShS1IwRilYt1d+pUV2hv0hqWfiCewfblFXzNZLUCI=
X-Gm-Gg: AZFdTZeDa2i1/+Chlq+ssaj6q60UPPNgUm6T9VNvvjnkeCMJbitVCJ+KzExcYmpwoni
	aHcADF4fi2CHsSNcqAs5aK2i4mTbRslhMhmcr9BnqpsMJm/e4PtletpDaEEhiufFll1/b7T8Own
	TyLpYZjxQyzVcf6BDyy8oFIRz6bfdtswSMyCnK9ScMtiVqfIytAP0RzkKNqrMzIiyJP4fhCQ+iR
	Hl5SpYmf0pAkl50OSDSSjl7FwZt71HqjN8ZqQ0GohPFxkKArzwyWr4pmH2q2rWkdCOxTaDTSjZt
	yW9QXl4tZXP/H4g9ODd3f6UMB7TFJa8KIIFwa8bYA6vS1liw+Tkv8VFWqJqUc6wOrU96V8L6G0u
	2zV8LsYFv2VZ5amq9CdggvMDiXid7VLSnvf5qOek3YNWH9aFoWZSZV1ixhXkVpZ7eZ3uRb0Lbmq
	BC5gyBxnBlUMc9lqhYYbEjMyxaJyJbtlsMFdRt9EFq9XHYrRjFnQFK3sHcMtSgzyAI4cf5T/Dla
	UJ+i7GTWEfsm8W9cjMJwLEenXQFxv50j7Ywwq9cRfzunGwS/rpi1vE/v9ex+8NL72ij0VwvsT1b
	TL9z2I9llODlg9Z4PRfSTnRHqWqdi3d18CtZpHZaryQQ04LnkhCsiDp+HpJhN4s+1f0GhasNdZf
	TxRU1WjdYP9lly4ZUo/EMtYWbFRBow2LjeDtKlInM7GTj3RbMpZHdJOC33dWsv6kL
X-Received: by 2002:a05:6a21:e113:b0:3fa:ab6:3879 with SMTP id adf61e73a8af0-4014db64243mr14653579637.49.1795480534063;
        Mon, 23 Nov 2026 16:35:34 -0800 (PST)
Received: from iiitd-S2600STB.iiitd.edu.in ([103.25.231.160])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6cfc8829sm6076667a12.8.2026.11.23.16.35.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 16:35:33 -0800 (PST)
From: Piyus Kedia <piyus@iiitd.ac.in>
To: Johannes Berg <johannes@sipsolutions.net>,
	linux-wireless@vger.kernel.org
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kapil Vaswani <kapil@presceralabs.ai>
Subject: [BUG] wifi: mac80211: one JOIN_MESH writes 479 bytes past the mesh beacon, because the extra IE blob is budgeted once and copied twice
Date: Tue, 24 Nov 2026 06:05:24 +0530
Message-Id: <20261124003526.78471-1-piyus@iiitd.ac.in>
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

Hello,

ieee80211_mesh_build_beacon() sizes the beacon for the user's extra IE blob
once, and two of the builders that fill the tail both draw from that blob.  An
IE blob that begins with a vendor IE and contains an RSN IE after it therefore
has that RSN IE emitted twice, and the tail copy runs past the allocation.

One NL80211_CMD_JOIN_MESH is enough.  Reproduced on net.git main at
af6737b90668, 7.4.0-rc3-01164, with KASAN.  A two-patch series follows in this
thread.


1. Root cause

net/mac80211/mesh.c, ieee80211_mesh_build_beacon():

	tail_len = 2 + (IEEE80211_MAX_SUPP_RATES - 8) +
		   ... +
		   ifmsh->ie_len;            <-- the blob, counted once

	bcn = kzalloc(sizeof(*bcn) + head_len + tail_len, GFP_KERNEL);
	/* need an skb for IE builders to operate on */
	skb = __dev_alloc_skb(max(head_len, tail_len), GFP_KERNEL);

The tail is then built in an skb and copied in:

	skb_trim(skb, 0);
	bcn->tail = bcn->head + bcn->head_len;

	if (ieee80211_put_srates_elem(...) ||
	    mesh_add_rsn_ie(sdata, skb) ||          <-- reads the blob
	    ...
	    mesh_add_vendor_ies(sdata, skb))        <-- reads the blob
		goto out_free;

	bcn->tail_len = skb->len;
	memcpy(bcn->tail, skb->data, bcn->tail_len);

mesh_add_vendor_ies() emits everything from the first vendor IE to the end of
the blob:

	offset = ieee80211_ie_split_vendor(ifmsh->ie, ifmsh->ie_len, 0);

	if (offset < ifmsh->ie_len) {
		len = ifmsh->ie_len - offset;
		data = ifmsh->ie + offset;
		if (skb_tailroom(skb) < len)
			return -ENOMEM;
		skb_put_data(skb, data, len);
	}

and mesh_add_rsn_ie() searches all of it:

	data = cfg80211_find_ie(WLAN_EID_RSN, ifmsh->ie, ifmsh->ie_len);
	if (!data)
		return 0;

	len = data[1] + 2;

	if (skb_tailroom(skb) < len)
		return -ENOMEM;
	skb_put_data(skb, data, len);

Put a vendor IE first and an RSN IE behind it, and
ieee80211_ie_split_vendor() returns 0: the vendor builder copies the whole
blob, and the RSN builder copies the RSN element a second time.  The two
together exceed the one ifmsh->ie_len the beacon was sized with.

The skb_tailroom() tests in both builders do not catch it: the skb is
allocated max(head_len, tail_len), which is larger than tail_len whenever the
head is the bigger of the two, so the builders have room the destination does
not.


2. Impact

A heap out-of-bounds write of attacker-chosen bytes - the IE blob is the
attacker's own - immediately after a kzalloc'd beacon_data, from a single
netlink command.  It needs CAP_NET_ADMIN in the owning netns and a
mesh-capable device, which a user namespace plus mac80211_hwsim provides.

The length is the attacker's choice up to the overrun, so this is a
controlled-content heap overflow rather than a crash: KASAN stops it, an
unprotected kernel does not.


3. KASAN report

net.git main, 7.4.0-rc3-01164-gaf6737b90668, KASAN (full log attached as
kasan-mesh-beacon-oob-write-mainline-7.4-rc3.txt):

  BUG: KASAN: slab-out-of-bounds in ieee80211_mesh_build_beacon+0xe3f/0xf00
  Write of size 479 at addr ffff88805ca1887b by task x/9448
   __asan_memcpy                      mm/kasan/shadow.c:106
   ieee80211_mesh_build_beacon        net/mac80211/mesh.c:1110
   ieee80211_start_mesh               net/mac80211/mesh.c:1187
   ieee80211_join_mesh                net/mac80211/cfg.c:3330
   rdev_join_mesh                     net/wireless/rdev-ops.h:361
   __cfg80211_join_mesh               net/wireless/mesh.c:214
   nl80211_join_mesh                  net/wireless/nl80211.c:15399
   genl_family_rcv_msg_doit           net/netlink/genetlink.c:1114

The same reproducer on 7.3.1 gives the same write at the same source line
(kasan-mesh-beacon-oob-write-7.3.1.txt).  net/mac80211/mesh.c is
byte-identical between 7.3.1 and af6737b90668, and nothing in the 34 commits
between af6737b90668 and today's net.git tip touches net/mac80211 or
net/wireless.


4. Reproducer

mesh_join_rsn_after_vendor_oob.c in this directory (sent off-list on request;
see the note at the end).  It loads mac80211_hwsim, puts the interface into
mesh point mode and issues one JOIN_MESH whose NL80211_ATTR_IE holds a vendor
IE followed by an RSN IE.  It faults on the first attempt on both trees.
CONFIG_MAC80211_MESH, CONFIG_MAC80211_HWSIM and KASAN are required.


5. Suggested fix

1/2 confines the RSN search to the non-vendor part of the blob, so the two
builders cover disjoint ranges and their total cannot exceed ifmsh->ie_len:

	+	prefix = ieee80211_ie_split_vendor(ifmsh->ie, ifmsh->ie_len, 0);
	+	data = cfg80211_find_ie(WLAN_EID_RSN, ifmsh->ie, prefix);

That split is safe to use as a length here: the blob has passed
validate_ie_attr(), which walks the element chain and requires it to end
exactly at the end of the attribute, so the result is an element boundary not
past ifmsh->ie_len.  An RSN IE behind a vendor IE is still emitted, inside the
verbatim vendor range.

2/2 is not a memory-safety fix and can be dropped if you would rather take
only the first: the same two functions hold u8 values derived from a size_t
length that reaches IEEE80211_MAX_DATA_LEN.  `offset` in
mesh_add_vendor_ies() truncates for a blob whose vendor IEs begin past byte
255, so the copy starts inside an earlier element; `len = data[1] + 2` in
mesh_add_rsn_ie() is 257 for the largest RSN IE and truncates to 1.

Both patches carry Fixes: 2b5e19677592 ("mac80211: cache mesh beacon"), which
is where the single budget term and the two builders arrived together.  Cc:
stable is on 1/2 only.  Checkpatch is clean on both.


6. What was and was not checked

Checked: the fault reproduces on net.git main under KASAN; the patched kernel
is clean on the same reproducer; a secure mesh whose blob carries the RSN IE
before any vendor IE still beacons with the RSN element present, with the
patches applied; mesh.c is identical between 7.3.1 and the current tip.

Not checked: real hardware - this is mac80211_hwsim under QEMU.  We have not
measured whether a mesh peer can be made to accept the malformed RSN element
that 2/2 fixes.

This was found by AI-driven fuzzing built on top of syzkaller; its analysis
was then checked by hand against the code and every claim above was
reproduced.

Kapil Vaswani
Piyus Kedia
